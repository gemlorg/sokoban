{-# LANGUAGE OverloadedStrings #-}
module Shapes( wall,ground, storage, box, drawTile, drawT, startScreen, endScreen, Tile(Wall, Ground, Storage, Box, Blank)) where


import           Data.Foldable (Foldable (foldl'))
import           Prelude
import Data.Text (Text, pack)              -- Import the Text type

import Data.String 
import           Types


import CodeCLI 


wall, ground, storage, box:: Picture
-- wallShade, wallLight::Picture
drawTile :: Tile -> Picture
startScreen :: Picture
-- startScreen = (lettering "Sokoban!")
startScreen = blank


endScreen :: State ->Picture
endScreen s = (stringLettering $ "Level " ++  (show $ stLevel s + 1 ) ++ " finished with " ++ (show $ stMove s) ++ " moves") & translated 0 (-2) (stringLettering "Press space key to continue")
-- endScreen s = lettering 'E'


wall =  lettering '#'
box = lettering '$'
ground = lettering ' '
storage = lettering '.'

-- dtawT :: Integer -> Integer -> Tile -> Picture
drawT :: Integer -> Integer -> Tile -> Picture
drawT x y Wall = letteringAt x y '#'
drawT x y Ground = letteringAt x y ' '
drawT x y Storage = letteringAt x y '.'
drawT x y Box = letteringAt x y '$'
drawT x y Blank = letteringAt x y ' '

drawTile Wall    = wall
drawTile Ground  = ground
drawTile Storage = storage
drawTile Box     = box
drawTile Blank   = blank


composePic :: [Picture] -> Picture
composePic = foldl' (&) (blank)








