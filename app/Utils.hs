{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE OverloadedStrings   #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}

module Utils where

import           CodeWorld
import           Data.Foldable (Foldable (foldl'))
import           GHC.Float     (int2Double)
import           Player
import           Shapes
import           Types


resettableActivityOf ::
    world ->
    (Event -> world -> world) ->
    (world -> Picture) ->
    IO ()
resettableActivityOf a b  = activityOf a (handleReset a b)

handleReset :: world -> (Event -> world -> world) -> Event -> world -> world
handleReset w f (KeyPress key) s
    | key == "Esc" = w  -- on this level of abstraction, "w" perhaps is the only presented notion of the initial state
handleReset w f a b  = f a b



handleEvent :: Event -> State -> State
handleEvent (KeyPress key) s
    | key == "Right" = move R s
    | key == "Up"    = move U s
    | key == "Left"  = move L s
    | key == "Down"  = move D s
handleEvent _ s      = s

move:: Direction -> State -> State
move dir s = rotatePlayer dir (if (isAvailable s $ adjacentCoord dir s.stPlayer) then s {stPlayer = adjacentCoord dir s.stPlayer}
    else s)

rotatePlayer :: Direction -> State -> State
rotatePlayer dir s = s{stDir = dir}

isAvailable :: State -> Coord -> Bool
isAvailable s (C x y) = maze x y ==  Storage || maze x y == Ground

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

moveCoords [] x     =  x
moveCoords (x:xs) y = moveCoords xs (adjacentCoord x y)
-- moveCoords = foldl (adjacentCoord) (idCoord)


drawState :: State-> Picture
drawState s = player1 & atCoord (negateCoord s.stPlayer) pictureOfMaze

drawWalk1 :: State-> Picture
drawWalk1 s = player1 & atCoord (negateCoord s.stPlayer) pictureOfMaze

drawWalk2 :: State-> Picture
drawWalk2 s = player2 s.stDir & atCoord (negateCoord s.stPlayer) pictureOfMaze

negateCoord:: Coord -> Coord
negateCoord (C x y) = C (-x) (-y)

composePic :: [Picture] -> Picture
composePic = foldl' (&) blank


pictureOfMaze :: Picture
pictureOfMaze =    composePic [translated (int2Double x) (int2Double y) $ drawTile $ maze x y | x <- [-10..10], y <- [-10..10]]



maze :: Int -> Int -> Tile
maze x y
  | abs x > 4  || abs y > 4  = Blank
  | abs x == 4 || abs y == 4 = Wall
  | x ==  2 && y <= 0        = Wall
  | x ==  3 && y <= 0        = Storage
  | x >= -2 && y == 0        = Box
  | otherwise                = Ground
