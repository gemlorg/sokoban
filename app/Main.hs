-- {-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -Wno-missing-fields #-}
module Main where
import Data.Char

import           Data.Foldable (Foldable (foldl'))
import           GHC.Float     (int2Double)
import           Player
import           Shapes
import           Types
import           Utils
import           Levels
import ListFs ( reachableFrom)

import           System.IO


type Program = IO ()

main :: IO ()

main = etap5

-- main = do 
--     hSetBuffering stdin NoBuffering
--     hSetBuffering stdout NoBuffering
--     contents <- getContents
--     putStr "\ESCc"
--     putStr contents




etap5 :: IO()
etap5 = runActivity walk4_act

lvl1 = initLevel mazes


walk4_act :: Activity (SSState (WithUndo State))
walk4_act =   resettable $ withStartScreen (levels lvl1)$ withUndo  (Activity lvl1 handleEvent draw)

initLevel:: [Maze] -> State
initLevel [] = error "empty levels"
initLevel (x:xs) =   S {stPlayer = initialPos x, stDir = U, stBoxes = getBoxes x, stMap = x, stXdim = [], stYdim = [], stLevel = 0, stMove = 0,levels=x:xs}




