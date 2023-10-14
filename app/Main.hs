{-# LANGUAGE OverloadedStrings #-}
module Main where

import           CodeWorld
import           Data.Foldable (Foldable (foldl'))
import           GHC.Float     (int2Double)
import           Player
import           Shapes
import           Types
import           Utils



type Program = IO ()

main :: IO ()
-- module Data.Angle where

-- main = activityOf initial handleEvent drawState where initial = initLevel blank
-- main = drawingOf player1
main = walk1

walk1 :: IO ()
walk1 = activityOf initial handle draw
  where
    initial = initLevel blank
    handle = handleEvent
    draw = drawWalk1

walk2 :: IO ()
walk2 = activityOf initial handle draw
  where
    initial = initLevel blank
    handle = handleEvent
    draw = drawWalk2

walk3 :: IO ()
walk3 = resettableActivityOf initial handle draw
  where
    initial = initLevel blank
    handle = handleEvent
    draw = drawWalk2




initLevel:: Picture -> State
initLevel pic = S {stPlayer = C 0 (-1), stDir = U}

