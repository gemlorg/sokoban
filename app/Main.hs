module Main where

import CodeWorld
import Shapes 
import CodeWorld (rectangle)
import GHC.Float (int2Double)
import Data.Foldable (Foldable(foldl'))


main :: IO ()
-- module Data.Angle where
main = drawingOf pictureOfMaze

pictureOfMaze :: Picture

pictureOfMaze =   composePic [translated (int2Double x) (int2Double y) $ drawTile $ maze (toInteger x) (toInteger y) | x <- [-10..10], y <- [-10..10]]

composePic :: [Picture] -> Picture
composePic = foldl' (&) (rectangle 0 0)

maze :: Integer -> Integer -> Integer
maze x y
  | abs x > 4  || abs y > 4  = 0  -- blank
  | abs x == 4 || abs y == 4 = 1  -- wall
  | x ==  2 && y <= 0        = 1  -- wall
  | x ==  3 && y <= 0        = 3  -- storage
  | x >= -2 && y == 0        = 4  -- box
  | otherwise                = 2  -- ground
