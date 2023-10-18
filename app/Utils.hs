{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}

module Utils where

import Types
import Player
import CodeWorld
import Data.Foldable (Foldable(foldl'))
import GHC.Float (int2Double)
import Data.Foldable (Foldable(foldl'))
import Shapes
import qualified Types


resettable :: Activity s -> Activity s
resettable (Activity state0 handle draw)
  = Activity state0 handle' draw
  where handle' (KeyPress key) _ | key == "Esc" = state0
        handle' e s = handle e s


withStartScreen :: Activity s -> Activity (SSState s)
withStartScreen (Activity state0 handle draw)
  = Activity state0' handle' draw'
  where
    state0' = StartScreen

    handle' (KeyPress key) StartScreen
         | key == " "                  = Running state0
    handle' _              StartScreen = StartScreen
    handle' e              (Running s) = Running (handle e s)

    draw' StartScreen = startScreen
    draw' (Running s) = draw s



runActivity :: Activity s -> IO ()
runActivity (Activity state0 handle draw) = activityOf state0 handle draw




handleEvent :: Event -> State -> State
handleEvent (KeyPress key) s
    | key == "Right" || key == "d" = move R s
    | key == "Up"    || key == "w" = move U s
    | key == "Left"  || key == "a" = move L s
    | key == "Down"  || key == "s" = move D s
handleEvent _ s      = s




move:: Direction -> State -> State
-- move dir s = rotatePlayer dir (if (isAvailable (rotatePlayer dir s) $ adjacentCoord dir s.stPlayer) then s {stPlayer = adjacentCoord dir s.stPlayer}
--     else s)

move dir s
    | canMove dir s = rotatePlayer dir $ movePlayer dir $ moveBox (adjacentCoord dir s.stPlayer) dir s
--     | isFree adjacentCoord dir s.stPlayer = movePlayer $ rotatePlayer dir s
--     | isAvailable $ adjacentCoord dir s.stPlayer = moveBox $ movePlayer $ rotatePlayer dir s
move dir s = rotatePlayer dir  s

moveBox c dir s  = s{stBoxes = [if c == x then adjacentCoord dir x else x | x <- s.stBoxes]}
movePlayer dir s = s{stPlayer = adjacentCoord dir s.stPlayer}

isFree :: State -> Coord -> Bool
isFree s c = eq ((mapWBoxes s) c)  Storage || eq ((mapWBoxes s) c)  Ground -- the LSP highlights == as a mistake so had to use  different syntax


canMove :: Direction -> State  -> Bool
canMove  dir s  = isFree s (adjacentCoord dir s.stPlayer) || (mapWBoxes s) (adjacentCoord dir s.stPlayer) == Box && isFree s (adjacentCoord dir $ adjacentCoord dir s.stPlayer)



removeBoxes :: Maze -> Maze
removeBoxes f c
    | (f c) == Box = Ground
removeBoxes f c = f c

find:: Coord -> [Coord] -> Bool
find _ [] = False
find n (x:xs)
  |  x == n = True
  | otherwise = find n xs

addBoxes :: [Coord] -> Maze -> Maze
addBoxes [] f c = f c
addBoxes l f c = if find c l then Box else f c

rotatePlayer :: Direction -> State -> State
rotatePlayer dir s = s{stDir = dir}


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
draw s = if isWinning s then endScreen else player2 s.stDir & atCoord (negateCoord s.stPlayer) (pictureOfMaze  (mapWBoxes s))



negateCoord:: Coord -> Coord
negateCoord (C x y) = C (-x) (-y)

composePic :: [Picture] -> Picture
composePic = foldl' (&) blank



pictureOfMaze :: Maze -> Picture
pictureOfMaze maze =    composePic [translated (int2Double x) (int2Double y) $ drawTile $ maze (C x y) | x <- [-10..10], y <- [-10..10]]


mapWBoxes :: State -> Maze
mapWBoxes s=  addBoxes (stBoxes s) $ removeBoxes $ s.stMap

isWinning :: State -> Bool
isWinning s = and [s.stMap x == Storage | x <- s.stBoxes]


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