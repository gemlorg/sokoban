module Player(player2) where

import           Types
import CodeCLI


player2 :: Direction -> Picture
player2 dir = lettering 'P'

angle :: Direction -> Double
angle U = 0
angle R = 3 / 2 * pi
angle D = pi
angle L = pi/2







