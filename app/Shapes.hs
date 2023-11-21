{-# LANGUAGE OverloadedStrings #-}
module Shapes( wall,ground, storage, box, drawTile, startScreen, endScreen, Tile(Wall, Ground, Storage, Box, Blank)) where

import           CodeWorld
import           Data.Foldable (Foldable (foldl'))
import           Prelude
import Data.Text (Text, pack)              -- Import the Text type

import Data.String 
import           Types



wall, ground, storage, box:: Picture
hLine:: Double -> Picture
-- wallShade, wallLight::Picture
drawTile :: Tile -> Picture
startScreen :: Picture
startScreen = scaled 3 3 (lettering "Sokoban!")


endScreen :: State ->Picture
endScreen s = translated 0 (2) (lettering $ pack $ "Level " ++  (show $ stLevel s + 1 ) ++ " finished with " ++ (show $ stMove s) ++ " moves") & translated 0 (0) (lettering "Press space to continue")



wall =  wallShade & wallLight & vSep 0 2 & vSep 1 1 & vSep 2 2 & colored  wallColor ( solidRectangle 1 1)
box = woodCords (-0.5, 0.3) (0.5, 0.5) & woodCords (-0.5, -0.5) (0.5, -0.3) & composePic [woodCords (x, -0.3) (x + 0.25, 0.3) | x <- [-0.5, -0.25, 0, 0.25]]
ground = colored groundColor $ solidRectangle 1 1
storage = star & ground


drawTile Wall    = wall
drawTile Ground  = ground
drawTile Storage = storage
drawTile Box     = box
drawTile Blank   = blank


star = colored starColor $ solidCircle starSize





composePic :: [Picture] -> Picture
composePic = foldl' (&) (blank)

woodCords (x1, x2) (y1, y2) = translated x1 x2 $ translated (y1/2 - x1/2) (y2/2 - x2/2) $ woodenPlate ( y1-x1) (y2-x2)
woodenPlate a b = colored woodShadeColor (thickPolyline lineThickness [(-a/2,-b/2 + lineThickness / 2), (a/2,-b/2 + lineThickness / 2)] & thickPolyline lineThickness [(a/2 - lineThickness / 2, b/2), (a/2 - lineThickness/2,-b/2)]) & colored woodColor $ solidRectangle a b


wallLight = translated 0 (0.5 - lineThickness  / 2) $ colored wallLightColor $ hLine (0) & hLine (-1/3) & hLine (-2/3)
wallShade = colored wallShadeColor $ translated 0 ( -1/3 + lineThickness) wallLight

hLine n = thickPolyline lineThickness [(-0.5, n), (0.5, n)]
vSep i j = darkSep i j & lightSep i j
darkSep i j = colored wallShadeColor $ translated (-0.5 - lineThickness / 2 + (j - lineThickness) / 3) (0.5 - i/3) $ thickPolyline lineThickness [(0, 0), (0,- 1/3 )]
lightSep i j= translated lineThickness 0 $ colored wallLightColor $ darkSep i j

lineThickness = 0.02
starSize = 0.1
wallColor = RGB (90/255) (105/255) (136/255)
wallShadeColor = RGB (59/255) (70/255) (105/255)
wallLightColor = RGB (142/255) (153/255) (183/255)
woodColor = blue
woodShadeColor = black
groundColor = purple
starColor = yellow

