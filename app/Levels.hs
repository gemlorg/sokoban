module Levels where 

import Types
import CodeWorld

maze_1 :: MazeMap 
maze_1 = makeMaze (C 0 (-1)) mazeF_1

makeMaze :: Coord -> (Maze) -> MazeMap 
makeMaze c f = M c ([C x y | x <- [-10 .. 10], y <- [-10 .. 10], f (C x y) == Box ]) f


mazeF_1 :: Coord -> Tile
mazeF_1 (C x y)
  | abs x > 4  || abs y > 4  = Blank
  | abs x == 4 || abs y == 4 = Wall
  | x ==  2 && y <= 0        = Wall
  | x ==  3 && y <= 0        = Storage
  | x >= -2 && y == 0        = Box
  | otherwise                = Ground