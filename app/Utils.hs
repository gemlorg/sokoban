{-# LANGUAGE OverloadedStrings #-}
-- {-# LANGUAGE OverloadedRecordDot #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}


module Utils where

import Types
import Player
import CodeWorld
import GHC.Float (int2Double)
import Data.Foldable (Foldable(foldl'))
import Shapes
import Levels
import qualified Types
import ListFs




resettable :: Activity s -> Activity s
resettable (Activity state0 handle draw)
  = Activity state0 handle' draw
  where handle' (KeyPress key) _ | key == "Esc" = state0
        handle' e s = handle e s


withStartScreen ::[Maze] -> Activity s -> Activity (SSState s)
withStartScreen mazes (Activity state0 handle draw)
  = Activity state0' handle' draw'
  where
    state0' = StartScreen

    handle' (KeyPress key) StartScreen
         | key == " "                  = Running state0
    handle' _              StartScreen = StartScreen
    handle' e              (Running s) = Running (handle e s)

    draw' StartScreen = etap4 mazes
    draw' (Running s) = draw s
etap4 :: [Maze] -> Picture 
etap4 m = pictureOfBools (map (\x -> isClosed x && isSane x) m)


withUndo :: Eq a => Activity a -> Activity (WithUndo a)
withUndo (Activity state0 handle draw) = Activity state0' handle' draw' where

    handle' (KeyPress key) (WithUndo s stack) | key == "U"
      = case stack of s':stack' -> WithUndo s' stack'
                      []        -> WithUndo s []
    handle' e              (WithUndo s stack)
       | s' == s = WithUndo s stack
       | otherwise = WithUndo (handle e s) (s:stack)
      where s' = handle e s

    state0' = WithUndo state0 []
    -- handle' (KeyPress key) (WithUndo s stack) | key == "U"
    --   = case stack of s':stack' -> WithUndo s' stack'
    --                   []          -> WithUndo s []
    -- handle' e              (WithUndo s stack)
    --    = WithUndo (handle e s) (s:stack)
    draw' (WithUndo s _) = draw s



runActivity :: Activity s -> IO ()
runActivity (Activity state0 handle draw) = activityOf state0 handle draw




handleEvent :: Event -> State -> State
handleEvent (KeyPress key) s
    | key == "Right" || key == "d" = move R s
    | key == "Up"    || key == "w" = move U s
    | key == "Left"  || key == "a" = move L s
    | key == "Down"  || key == "s" = move D s
    | key == "N"     || key == "n" || (key == " " && isWinning s) = nextLevel s
handleEvent _ s      = s

getBoxes m  = [C x y | x <- [-20  .. 20], y <- [-20 .. 20], f m (C x y) == Box ]


getNextMaze :: State -> Maze
getNextMaze s = ((levels s)!!(fromIntegral $ (stLevel s) + 1))

nextLevel :: State -> State
nextLevel s 
  | stLevel s == toInteger (length (levels s) -  1) = s
nextLevel s = S {stPlayer = initialPos $ getNextMaze s, stDir = U, stBoxes = getBoxes $ getNextMaze s, stMap = getNextMaze s, stXdim = [], stYdim = [], stLevel = stLevel s + 1, stMove = 0,levels= levels s}


move:: Direction -> State -> State
-- move dir s = rotatePlayer dir (if (isAvailable (rotatePlayer dir s) $ adjacentCoord dir s.stPlayer) then s {stPlayer = adjacentCoord dir s.stPlayer}
--     else s)

move dir s
    | canMove dir s = rotatePlayer dir $ movePlayer dir $ moveBox (adjacentCoord dir (stPlayer s)) dir s
--     | isFree adjacentCoord dir s.stPlayer = movePlayer $ rotatePlayer dir s
--     | isAvailable $ adjacentCoord dir s.stPlayer = moveBox $ movePlayer $ rotatePlayer dir s
move dir s = rotatePlayer dir  s

moveBox :: Coord -> Direction -> State -> State
moveBox c dir s  = s{stBoxes = [if c == x then adjacentCoord dir x else x | x <- (stBoxes s)]}
movePlayer dir s = s{stPlayer = adjacentCoord dir (stPlayer s)}

isFree :: State -> Coord -> Bool
isFree s c = eq ((mapWBoxes s) c)  Storage || eq ((mapWBoxes s) c)  Ground -- the LSP highlights == as a mistake so had to use  different syntax


canMove :: Direction -> State  -> Bool
canMove  dir s  = isFree s (adjacentCoord dir (stPlayer s)) || (mapWBoxes s) (adjacentCoord dir (stPlayer s)) == Box && isFree s (adjacentCoord dir $ adjacentCoord dir (stPlayer s))



removeBoxes :: MazeMap -> MazeMap
removeBoxes f c
    | (f c) == Box = Ground
removeBoxes f c = f c

find:: Coord -> [Coord] -> Bool
find _ [] = False
find n (x:xs)
  |  x == n = True
  | otherwise = find n xs

addBoxes :: [Coord] -> MazeMap -> MazeMap
addBoxes [] f c = f c
addBoxes l f c = if find c l then Box else f c

rotatePlayer :: Direction -> State -> State
rotatePlayer dir s = s{stDir = dir, stMove = stMove s + 1}


initialCoord :: Coord
initialCoord = C 0 0

atCoord :: Coord -> Picture -> Picture
atCoord (C x y) = translated (fromIntegral x) (fromIntegral y)

adjacentCoord :: Direction -> Coord -> Coord
adjacentCoord R (C x y) = C (x+1) y
adjacentCoord L (C x y) = C (x-1) y
adjacentCoord U (C x y) = C x (y+1)
adjacentCoord D (C x y) = C x (y-1)

moveCoords :: [Direction] -> Coord -> Coord

moveCoords [] x =  x
moveCoords (x:xs) y = moveCoords xs (adjacentCoord x y)


draw :: State -> Picture
draw s = if isWinning s then endScreen s else player2 (stDir s) & atCoord (negateCoord (stPlayer s)) (pictureOfMaze  (mapWBoxes s))



negateCoord:: Coord -> Coord
negateCoord (C x y) = C (-x) (-y)

composePic :: [Picture] -> Picture
composePic = foldl' (&) blank



pictureOfMaze :: MazeMap -> Picture
pictureOfMaze maze =    composePic [translated (int2Double x) (int2Double y) $ drawTile $ maze (C x y) | x <- [-20..20], y <- [-20..20]]


mapWBoxes :: State -> MazeMap
mapWBoxes s =  addBoxes (stBoxes s) $ removeBoxes  (f $ stMap s)

isWinning :: State -> Bool
isWinning s = and [( f $ stMap s) x == Storage | x <- (stBoxes s), elemList x (reachableFrom (stPlayer s ) (neighbours $ stMap s) [])]

isClosed :: Maze -> Bool
isClosed m = allList (checkCoord m ) (reachableFrom (initialPos m) (neighbours m ) []) && checkStart m

checkStart m =  (f m) (initialPos m) == Ground || (f m) (initialPos m) == Storage

neighbours m (C x y)= if abs x > 20 || abs y > 20 || f m (C x y) == Wall then [] else [ (C (x + 1) y), (C x (y - 1)), (C x (y + 1)), (C (x - 1) y)]

checkCoord :: Maze -> Coord -> Bool
checkCoord m c = f m c /= Blank


pictureOfBools :: [Bool] -> Picture
pictureOfBools xs = translated (-fromIntegral k / 2) (fromIntegral k) (go 0 xs)
  where n = length xs
        k = findK 0 -- k is the integer square of n
        findK i | i * i >= n = i
                | otherwise  = findK (i+1)
        go _ [] = blank
        go i (b:bs) =
          translated (fromIntegral (i `mod` k))
                     (-fromIntegral (i `div` k))
                     (pictureOfBool b)
          & go (i+1) bs

        pictureOfBool True =  colored green (solidCircle 0.4)
        pictureOfBool False = colored red   (solidCircle 0.4)



isSane :: Maze -> Bool
isSane m = count Storage >= count Box where count t = length [x | x <- (reachableFrom (initialPos m) (neighbours m ) []), f m x == t]


-- drawState :: State-> Picture
-- drawState s = player1 & atCoord (negateCoord s.stPlayer) (pictureOfMaze s.stMap)

-- drawWalk1 :: State-> Picture
-- drawWalk1 s = player1 & atCoord (negateCoord s.stPlayer) (pictureOfMaze s.stMap)

-- drawWalk2 :: State-> Picture
-- drawWalk2 s = player2 s.stDir & atCoord (negateCoord s.stPlayer) (pictureOfMaze s.stMap)

-- isAvailableWalk :: State -> Coord -> Bool
-- isAvailableWalk s (C x y) = eq (s.stMap (C x y))  Storage || eq (s.stMap (C x y))  Ground || eq (s.stMap (C x y))  Storage -- the LSP highlights == as a mistake so had to use  different syntax

-- walk:: Direction -> State -> State
-- walk dir s = rotatePlayer dir (if (isAvailableWalk s $ adjacentCoord dir s.stPlayer) then s {stPlayer = adjacentCoord dir s.stPlayer}
--     else s)

-- handleWalk :: Event -> State -> State
-- handleWalk (KeyPress key) s
--     | key == "Right" || key == "d" = walk R s
--     | key == "Up"    || key == "w" = walk U s
--     | key == "Left"  || key == "a" = walk L s
--     | key == "Down"  || key == "s" = walk D s
-- handleWalk _ s      = s





-- startScreenActivityOf ::
--     world ->
--     (Event -> world -> world) -> 
--     (world -> Picture) ->
--     IO ()
-- startScreenActivityOf state0 handle draw
--   = activityOf state0' handle' draw'
--   where
--     state0' = StartScreen

--     handle' (KeyPress key) StartScreen
--          | key == " "                  = Running state0
--     handle' _              StartScreen = StartScreen
--     handle' e              (Running s) = Running (handle e s)

--     draw' StartScreen = startScreen
--     draw' (Running s) = draw s

-- resettableActivityOf ::
--     world ->
--     (Event -> world -> world) ->
--     (world -> Picture) ->
--     IO ()
-- resettableActivityOf a b  = activityOf a (handleReset a b)

-- handleReset :: world -> (Event -> world -> world) -> Event -> world -> world
-- handleReset w f (KeyPress key) s
--     | key == "Esc" = w  -- on this level of abstraction, "w" perhaps is the only presented notion of the initial state
-- handleReset w f a b  = f a b