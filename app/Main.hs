-- {-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -Wno-missing-fields #-}
module Main where
import Data.Char

import           CodeWorld
import           Data.Foldable (Foldable (foldl'))
import           GHC.Float     (int2Double)
import           Player
import           Shapes
import           Types
import           Utils
import           Levels



type Program = IO ()

main :: IO ()
-- module Data.Angle where

-- main = activityOf initial handleEvent drawState where initial = initLevel blank
-- main = drawingOf player1
main = walk4

-- walk1 :: IO ()
-- walk1 = runActivity walk1_act
-- walk2 :: IO ()
-- walk2 = runActivity walk2_act
-- walk3 :: IO ()
-- walk3 = runActivity walk3_act
walk4 :: IO()
walk4 = runActivity walk4_act

lvl1 = initLevel maze_1

-- walk1_act = Activity lvl1 handleWalk drawWalk1
-- walk2_act = Activity lvl1 handleWalk drawWalk2

-- walk3_act =  withStartScreen (Activity lvl1 handleWalk drawWalk2)
walk4_act = resettable $ withStartScreen (Activity lvl1 handleEvent draw)

initLevel:: MazeMap -> State
initLevel (M player boxes f) =   S {stPlayer = player, stDir = U, stBoxes = boxes, stMap =   f}



