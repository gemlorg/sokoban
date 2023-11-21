module Levels where

import Types
import CodeWorld

-- maze_1 :: Maze
-- maze_1 = Maze (C 0 (-1)) mazeF_1
-- maze_2 = Maze (C 0 (0)) mazeF_2 





-- makeMaze :: Coord -> (MazeMap) -> Maze
-- makeMaze = Maze

-- ([C x y | x <- [-10 .. 10], y <- [-10 .. 10], f (C x y) == Box ])


-- mazeF_1 :: MazeMap
-- mazeF_1 (C x y)
--   | abs x > 4  || abs y > 4  = Blank
--   | abs x == 4 || abs y == 4 = Wall
--   | x ==  2 && y <= 0        = Wall
--   | x ==  3 && y <= 0        = Storage
--   | x >= -2 && y == 0        = Box
--   | otherwise                = Ground

-- mazeF_2 :: MazeMap 
-- mazeF_2 (C x y) 
    




mazes :: [Maze] 
mazes = [maze_1, maze_2, maze_3, maze_4, maze_5, maze_6, maze_7, maze_8, maze_9, maze_10, maze_155]
badMazes :: [Maze]
badMazes = [bad_maze_1, bad_maze_2, bad_maze_3, bad_maze_4, bad_maze_5, bad_maze_6, bad_maze_7, bad_maze_8]

maze_1 = Maze (C 0 0) mazeF_1

mazeF_1 (C x y)
    | y == -4 && x == 0 = Box
    | y == -3 && x >= -2 && x <= 1 = Wall
    | y == -2 && x >= -2 && x <= -2 = Wall
    | y == -2 && x >= -1 && x <= 0 = Ground
    | y == -2 && x >= 1 && x <= 3 = Wall
    | y == -1 && x >= -2 && x <= -2 = Wall
    | y == -1 && x >= -1 && x <= 0 = Ground
    | y == -1 && x >= 1 && x <= 1 = Box
    | y == -1 && x >= 2 && x <= 2 = Ground
    | y == -1 && x >= 3 && x <= 3 = Wall
    | y == 0 && x >= -2 && x <= -2 = Wall
    | y == 0 && x >= -1 && x <= -1 = Ground
    | y == 0 && x >= 0 && x <= 0 = Ground
    | y == 0 && x >= 1 && x <= 2 = Ground
    | y == 0 && x >= 3 && x <= 3 = Wall
    | y == 1 && x >= -2 && x <= -2 = Wall
    | y == 1 && x >= -1 && x <= 0 = Ground
    | y == 1 && x >= 1 && x <= 3 = Wall
    | y == 2 && x >= -2 && x <= -2 = Wall
    | y == 2 && x >= -1 && x <= -1 = Ground
    | y == 2 && x >= 0 && x <= 0 = Storage
    | y == 2 && x >= 1 && x <= 1 = Wall
    | y == 3 && x >= -2 && x <= 1 = Wall
    | otherwise = Blank

maze_2 = Maze (C 0 0) mazeF_2

mazeF_2 (C x y)
    | y == -4 && x >= -3 && x <= 2 = Wall
    | y == -3 && x >= -3 && x <= -3 = Wall
    | y == -3 && x >= -2 && x <= 1 = Ground
    | y == -3 && x >= 2 && x <= 2 = Wall
    | y == -2 && x >= -3 && x <= -3 = Wall
    | y == -2 && x >= -2 && x <= -2 = Ground
    | y == -2 && x >= -1 && x <= -1 = Storage
    | y == -2 && x >= 0 && x <= 0 = Ground
    | y == -2 && x >= 1 && x <= 1 = Ground
    | y == -2 && x >= 2 && x <= 2 = Wall
    | y == -1 && x >= -3 && x <= -3 = Wall
    | y == -1 && x >= -2 && x <= -2 = Ground
    | y == -1 && x >= -1 && x <= -1 = Box
    | y == -1 && x >= 0 && x <= 0 = Ground
    | y == -1 && x >= 1 && x <= 1 = Ground
    | y == -1 && x >= 2 && x <= 2 = Wall
    | y == 0 && x >= -3 && x <= -3 = Wall
    | y == 0 && x >= -2 && x <= -2 = Ground
    | y == 0 && x >= -1 && x <= -1 = Wall
    | y == 0 && x >= 0 && x <= 0 = Ground
    | y == 0 && x >= 1 && x <= 1 = Ground
    | y == 0 && x >= 2 && x <= 2 = Wall
    | y == 1 && x >= -3 && x <= -3 = Wall
    | y == 1 && x >= -2 && x <= 1 = Ground
    | y == 1 && x >= 2 && x <= 2 = Wall
    | y == 2 && x >= -3 && x <= 2 = Wall
    | otherwise = Blank

maze_3 = Maze (C 0 0) mazeF_3

mazeF_3 (C x y)
    | y == -1 && x >= -6 && x <= 2 = Wall
    | y == 0 && x >= -6 && x <= -6 = Wall
    | y == 0 && x >= -5 && x <= -5 = Ground
    | y == 0 && x >= -4 && x <= -4 = Storage
    | y == 0 && x >= -3 && x <= -3 = Ground
    | y == 0 && x >= -2 && x <= -2 = Storage
    | y == 0 && x >= -1 && x <= -1 = Wall
    | y == 0 && x >= 0 && x <= 0 = Ground
    | y == 0 && x >= 1 && x <= 1 = Ground
    | y == 0 && x >= 2 && x <= 2 = Wall
    | y == 1 && x >= -6 && x <= -6 = Wall
    | y == 1 && x >= -5 && x <= -5 = Ground
    | y == 1 && x >= -4 && x <= -4 = Wall
    | y == 1 && x >= -3 && x <= -2 = Ground
    | y == 1 && x >= -1 && x <= -1 = Wall
    | y == 1 && x >= 0 && x <= 0 = Box
    | y == 1 && x >= 1 && x <= 1 = Ground
    | y == 1 && x >= 2 && x <= 2 = Wall
    | y == 2 && x >= -6 && x <= -6 = Wall
    | y == 2 && x >= -5 && x <= -1 = Ground
    | y == 2 && x >= 0 && x <= 0 = Box
    | y == 2 && x >= 1 && x <= 1 = Ground
    | y == 2 && x >= 2 && x <= 2 = Wall
    | y == 3 && x >= -6 && x <= -4 = Wall
    | y == 3 && x >= -3 && x <= -2 = Ground
    | y == 3 && x >= -1 && x <= 2 = Wall
    | y == 4 && x >= -6 && x <= -5 = Ground
    | y == 4 && x >= -4 && x <= -1 = Wall
    | otherwise = Blank

maze_4 = Maze (C 0 0) mazeF_4

mazeF_4 (C x y)
    | y == -3 && x >= -6 && x <= -3 = Ground
    | y == -3 && x >= -2 && x <= 1 = Wall
    | y == -2 && x >= -6 && x <= -2 = Wall
    | y == -2 && x >= -1 && x <= 0 = Ground
    | y == -2 && x >= 1 && x <= 1 = Wall
    | y == -1 && x >= -6 && x <= -6 = Wall
    | y == -1 && x >= -5 && x <= 0 = Ground
    | y == -1 && x >= 1 && x <= 1 = Wall
    | y == 0 && x >= -6 && x <= -6 = Wall
    | y == 0 && x >= -5 && x <= -5 = Ground
    | y == 0 && x >= -4 && x <= -4 = Storage
    | y == 0 && x >= -3 && x <= -2 = Ground
    | y == 0 && x >= -1 && x <= -1 = Box
    | y == 0 && x >= 0 && x <= 0 = Ground
    | y == 0 && x >= 1 && x <= 1 = Wall
    | y == 1 && x >= -6 && x <= -6 = Wall
    | y == 1 && x >= -5 && x <= 0 = Ground
    | y == 1 && x >= 1 && x <= 1 = Wall
    | y == 2 && x >= -6 && x <= 1 = Wall
    | otherwise = Blank

maze_5 = Maze (C 0 0) mazeF_5

mazeF_5 (C x y)
    | y == -3 && x >= -4 && x <= 3 = Wall
    | y == -2 && x >= -4 && x <= -4 = Wall
    | y == -2 && x >= -3 && x <= 2 = Ground
    | y == -2 && x >= 3 && x <= 3 = Wall
    | y == -1 && x >= -4 && x <= -4 = Wall
    | y == -1 && x >= -3 && x <= -2 = Ground
    | y == -1 && x >= -1 && x <= -1 = Storage
    | y == -1 && x >= 0 && x <= 0 = Box
    | y == -1 && x >= 1 && x <= 1 = Storage
    | y == -1 && x >= 2 && x <= 2 = Ground
    | y == -1 && x >= 3 && x <= 3 = Wall
    | y == 0 && x >= -4 && x <= -3 = Wall
    | y == 0 && x >= -2 && x <= -2 = Ground
    | y == 0 && x >= -1 && x <= -1 = Box
    | y == 0 && x >= 0 && x <= 0 = Ground
    | y == 0 && x >= 1 && x <= 1 = Box
    | y == 0 && x >= 2 && x <= 2 = Ground
    | y == 0 && x >= 3 && x <= 3 = Wall
    | y == 1 && x >= -4 && x <= -4 = Ground
    | y == 1 && x >= -3 && x <= -3 = Wall
    | y == 1 && x >= -2 && x <= -2 = Ground
    | y == 1 && x >= -1 && x <= -1 = Storage
    | y == 1 && x >= 0 && x <= 0 = Box
    | y == 1 && x >= 1 && x <= 1 = Storage
    | y == 1 && x >= 2 && x <= 2 = Ground
    | y == 1 && x >= 3 && x <= 3 = Wall
    | y == 2 && x >= -4 && x <= -4 = Ground
    | y == 2 && x >= -3 && x <= -3 = Wall
    | y == 2 && x >= -2 && x <= 2 = Ground
    | y == 2 && x >= 3 && x <= 3 = Wall
    | y == 3 && x >= -4 && x <= -4 = Ground
    | y == 3 && x >= -3 && x <= 3 = Wall
    | otherwise = Blank

maze_6 = Maze (C 0 0) mazeF_6

mazeF_6 (C x y)
    | y == -3 && x >= -10 && x <= -6 = Wall
    | y == -2 && x >= -10 && x <= -10 = Wall
    | y == -2 && x >= -9 && x <= -7 = Ground
    | y == -2 && x >= -6 && x <= 1 = Wall
    | y == -1 && x >= -10 && x <= -10 = Wall
    | y == -1 && x >= -9 && x <= -9 = Ground
    | y == -1 && x >= -8 && x <= -8 = Box
    | y == -1 && x >= -7 && x <= -7 = Ground
    | y == -1 && x >= -6 && x <= -6 = Wall
    | y == -1 && x >= -5 && x <= -3 = Storage
    | y == -1 && x >= -2 && x <= 0 = Ground
    | y == -1 && x >= 1 && x <= 1 = Wall
    | y == 0 && x >= -10 && x <= -10 = Wall
    | y == 0 && x >= -9 && x <= -9 = Ground
    | y == 0 && x >= -8 && x <= -7 = Box
    | y == 0 && x >= -6 && x <= -2 = Ground
    | y == 0 && x >= -1 && x <= -1 = Wall
    | y == 0 && x >= 0 && x <= 0 = Ground
    | y == 0 && x >= 1 && x <= 1 = Wall
    | y == 1 && x >= -10 && x <= -10 = Wall
    | y == 1 && x >= -9 && x <= -6 = Ground
    | y == 1 && x >= -5 && x <= -3 = Wall
    | y == 1 && x >= -2 && x <= 0 = Ground
    | y == 1 && x >= 1 && x <= 1 = Wall
    | y == 2 && x >= -10 && x <= -5 = Wall
    | y == 2 && x >= -4 && x <= -4 = Ground
    | y == 2 && x >= -3 && x <= 1 = Wall
    | otherwise = Blank

maze_7 = Maze (C 0 0) mazeF_7

mazeF_7 (C x y)
    | y == -1 && x >= -3 && x <= 3 = Wall
    | y == 0 && x >= -3 && x <= -3 = Wall
    | y == 0 && x >= -2 && x <= -1 = Ground
    | y == 0 && x >= 0 && x <= 0 = Ground
    | y == 0 && x >= 1 && x <= 2 = Ground
    | y == 0 && x >= 3 && x <= 3 = Wall
    | y == 1 && x >= -3 && x <= -3 = Wall
    | y == 1 && x >= -2 && x <= -2 = Ground
    | y == 1 && x >= -1 && x <= -1 = Box
    | y == 1 && x >= 0 && x <= 0 = Storage
    | y == 1 && x >= 1 && x <= 1 = Box
    | y == 1 && x >= 2 && x <= 2 = Ground
    | y == 1 && x >= 3 && x <= 3 = Wall
    | y == 2 && x >= -3 && x <= -3 = Wall
    | y == 2 && x >= -2 && x <= -2 = Ground
    | y == 2 && x >= -1 && x <= -1 = Storage
    | y == 2 && x >= 0 && x <= 0 = Box
    | y == 2 && x >= 1 && x <= 1 = Storage
    | y == 2 && x >= 2 && x <= 2 = Ground
    | y == 2 && x >= 3 && x <= 3 = Wall
    | y == 3 && x >= -3 && x <= -3 = Wall
    | y == 3 && x >= -2 && x <= -2 = Ground
    | y == 3 && x >= -1 && x <= -1 = Box
    | y == 3 && x >= 0 && x <= 0 = Storage
    | y == 3 && x >= 1 && x <= 1 = Box
    | y == 3 && x >= 2 && x <= 2 = Ground
    | y == 3 && x >= 3 && x <= 3 = Wall
    | y == 4 && x >= -3 && x <= -3 = Wall
    | y == 4 && x >= -2 && x <= -2 = Ground
    | y == 4 && x >= -1 && x <= -1 = Storage
    | y == 4 && x >= 0 && x <= 0 = Box
    | y == 4 && x >= 1 && x <= 1 = Storage
    | y == 4 && x >= 2 && x <= 2 = Ground
    | y == 4 && x >= 3 && x <= 3 = Wall
    | y == 5 && x >= -3 && x <= -3 = Wall
    | y == 5 && x >= -2 && x <= 2 = Ground
    | y == 5 && x >= 3 && x <= 3 = Wall
    | y == 6 && x >= -3 && x <= 3 = Wall
    | otherwise = Blank

maze_8 = Maze (C 0 0) mazeF_8

mazeF_8 (C x y)
    | y == -10 && x >= -6 && x <= -5 = Ground
    | y == -10 && x >= -4 && x <= 0 = Wall
    | y == -9 && x >= -6 && x <= -4 = Wall
    | y == -9 && x >= -3 && x <= -1 = Ground
    | y == -9 && x >= 0 && x <= 0 = Wall
    | y == -8 && x >= -6 && x <= -6 = Wall
    | y == -8 && x >= -5 && x <= -3 = Ground
    | y == -8 && x >= -2 && x <= -2 = Wall
    | y == -8 && x >= -1 && x <= -1 = Ground
    | y == -8 && x >= 0 && x <= 0 = Wall
    | y == -7 && x >= -6 && x <= -6 = Wall
    | y == -7 && x >= -5 && x <= -5 = Ground
    | y == -7 && x >= -4 && x <= -4 = Wall
    | y == -7 && x >= -3 && x <= -1 = Ground
    | y == -7 && x >= 0 && x <= 0 = Wall
    | y == -6 && x >= -6 && x <= -6 = Wall
    | y == -6 && x >= -5 && x <= -2 = Ground
    | y == -6 && x >= -1 && x <= 0 = Wall
    | y == -5 && x >= -6 && x <= -3 = Wall
    | y == -5 && x >= -2 && x <= -2 = Ground
    | y == -5 && x >= -1 && x <= -1 = Wall
    | y == -4 && x >= -6 && x <= -4 = Ground
    | y == -4 && x >= -3 && x <= -3 = Wall
    | y == -4 && x >= -2 && x <= -2 = Ground
    | y == -4 && x >= -1 && x <= -1 = Wall
    | y == -3 && x >= -6 && x <= -4 = Ground
    | y == -3 && x >= -3 && x <= -3 = Wall
    | y == -3 && x >= -2 && x <= -2 = Ground
    | y == -3 && x >= -1 && x <= -1 = Wall
    | y == -2 && x >= -6 && x <= -5 = Ground
    | y == -2 && x >= -4 && x <= -3 = Wall
    | y == -2 && x >= -2 && x <= -2 = Ground
    | y == -2 && x >= -1 && x <= 1 = Wall
    | y == -1 && x >= -6 && x <= -5 = Ground
    | y == -1 && x >= -4 && x <= -4 = Wall
    | y == -1 && x >= -3 && x <= -3 = Ground
    | y == -1 && x >= -2 && x <= -1 = Box
    | y == -1 && x >= 0 && x <= 0 = Ground
    | y == -1 && x >= 1 && x <= 1 = Wall
    | y == 0 && x >= -6 && x <= -5 = Ground
    | y == 0 && x >= -4 && x <= -4 = Wall
    | y == 0 && x >= -3 && x <= -3 = Ground
    | y == 0 && x >= -2 && x <= -1 = Storage
    | y == 0 && x >= 0 && x <= 0 = Ground
    | y == 0 && x >= 1 && x <= 1 = Wall
    | y == 1 && x >= -6 && x <= -5 = Ground
    | y == 1 && x >= -4 && x <= 1 = Wall
    | otherwise = Blank

maze_9 = Maze (C 0 0) mazeF_9

mazeF_9 (C x y)
    | y == -4 && x >= -1 && x <= 1 = Ground
    | y == -4 && x >= 2 && x <= 4 = Wall
    | y == -3 && x >= -1 && x <= 0 = Ground
    | y == -3 && x >= 1 && x <= 2 = Wall
    | y == -3 && x >= 3 && x <= 3 = Storage
    | y == -3 && x >= 4 && x <= 4 = Wall
    | y == -2 && x >= -1 && x <= -1 = Ground
    | y == -2 && x >= 0 && x <= 1 = Wall
    | y == -2 && x >= 2 && x <= 3 = Ground
    | y == -2 && x >= 4 && x <= 4 = Wall
    | y == -1 && x >= -1 && x <= 0 = Wall
    | y == -1 && x >= 1 && x <= 3 = Ground
    | y == -1 && x >= 4 && x <= 4 = Wall
    | y == 0 && x >= -1 && x <= -1 = Wall
    | y == 0 && x >= 0 && x <= 0 = Ground
    | y == 0 && x >= 1 && x <= 2 = Box
    | y == 0 && x >= 3 && x <= 3 = Ground
    | y == 0 && x >= 4 && x <= 4 = Wall
    | y == 1 && x >= -1 && x <= -1 = Wall
    | y == 1 && x >= 0 && x <= 0 = Storage
    | y == 1 && x >= 1 && x <= 2 = Ground
    | y == 1 && x >= 3 && x <= 4 = Wall
    | y == 2 && x >= -1 && x <= 3 = Wall
    | otherwise = Blank

maze_10 = Maze (C 0 0) mazeF_10

mazeF_10 (C x y)
    | y == -3 && x >= -2 && x <= 6 = Wall
    | y == -2 && x >= -2 && x <= -2 = Wall
    | y == -2 && x >= -1 && x <= 5 = Ground
    | y == -2 && x >= 6 && x <= 6 = Wall
    | y == -1 && x >= -2 && x <= -2 = Wall
    | y == -1 && x >= -1 && x <= -1 = Ground
    | y == -1 && x >= 0 && x <= 0 = Wall
    | y == -1 && x >= 1 && x <= 1 = Ground
    | y == -1 && x >= 2 && x <= 2 = Wall
    | y == -1 && x >= 3 && x <= 3 = Ground
    | y == -1 && x >= 4 && x <= 4 = Wall
    | y == -1 && x >= 5 && x <= 5 = Ground
    | y == -1 && x >= 6 && x <= 8 = Wall
    | y == 0 && x >= -2 && x <= -2 = Wall
    | y == 0 && x >= -1 && x <= -1 = Ground
    | y == 0 && x >= 0 && x <= 0 = Ground
    | y == 0 && x >= 1 && x <= 1 = Ground
    | y == 0 && x >= 2 && x <= 2 = Box
    | y == 0 && x >= 3 && x <= 3 = Ground
    | y == 0 && x >= 4 && x <= 4 = Box
    | y == 0 && x >= 5 && x <= 5 = Ground
    | y == 0 && x >= 6 && x <= 6 = Box
    | y == 0 && x >= 7 && x <= 7 = Ground
    | y == 0 && x >= 8 && x <= 8 = Wall
    | y == 1 && x >= -2 && x <= 4 = Wall
    | y == 1 && x >= 5 && x <= 5 = Storage
    | y == 1 && x >= 6 && x <= 6 = Wall
    | y == 1 && x >= 7 && x <= 7 = Ground
    | y == 1 && x >= 8 && x <= 8 = Wall
    | y == 2 && x >= -2 && x <= 3 = Ground
    | y == 2 && x >= 4 && x <= 4 = Wall
    | y == 2 && x >= 5 && x <= 5 = Storage
    | y == 2 && x >= 6 && x <= 6 = Wall
    | y == 2 && x >= 7 && x <= 7 = Ground
    | y == 2 && x >= 8 && x <= 8 = Wall
    | y == 3 && x >= -2 && x <= 3 = Ground
    | y == 3 && x >= 4 && x <= 4 = Wall
    | y == 3 && x >= 5 && x <= 5 = Storage
    | y == 3 && x >= 6 && x <= 7 = Ground
    | y == 3 && x >= 8 && x <= 8 = Wall
    | y == 4 && x >= -2 && x <= 3 = Ground
    | y == 4 && x >= 4 && x <= 8 = Wall
    | otherwise = Blank




maze_155 = Maze (C 0 0) mazeF_155

mazeF_155 (C x y)
    | y == -1 && x >= -19 && x <= -15 = Wall
    | y == -1 && x >= -14 && x <= -8 = Ground
    | y == -1 && x >= -7 && x <= -4 = Wall
    | y == -1 && x >= -3 && x <= -3 = Ground
    | y == -1 && x >= -2 && x <= 1 = Wall
    | y == -1 && x >= 2 && x <= 4 = Ground
    | y == -1 && x >= 5 && x <= 10 = Wall
    | y == 0 && x >= -19 && x <= -19 = Wall
    | y == 0 && x >= -18 && x <= -16 = Ground
    | y == 0 && x >= -15 && x <= -7 = Wall
    | y == 0 && x >= -6 && x <= -5 = Ground
    | y == 0 && x >= -4 && x <= -2 = Wall
    | y == 0 && x >= -1 && x <= -1 = Ground
    | y == 0 && x >= 0 && x <= 0 = Ground
    | y == 0 && x >= 1 && x <= 5 = Wall
    | y == 0 && x >= 6 && x <= 7 = Ground
    | y == 0 && x >= 8 && x <= 8 = Wall
    | y == 0 && x >= 9 && x <= 9 = Ground
    | y == 0 && x >= 10 && x <= 10 = Wall
    | y == 1 && x >= -19 && x <= -19 = Wall
    | y == 1 && x >= -18 && x <= -18 = Ground
    | y == 1 && x >= -17 && x <= -17 = Wall
    | y == 1 && x >= -16 && x <= -4 = Ground
    | y == 1 && x >= -3 && x <= -3 = Wall
    | y == 1 && x >= -2 && x <= -2 = Ground
    | y == 1 && x >= -1 && x <= -1 = Box
    | y == 1 && x >= 0 && x <= 7 = Ground
    | y == 1 && x >= 8 && x <= 8 = Wall
    | y == 1 && x >= 9 && x <= 9 = Ground
    | y == 1 && x >= 10 && x <= 10 = Wall
    | y == 2 && x >= -19 && x <= -19 = Wall
    | y == 2 && x >= -18 && x <= -15 = Ground
    | y == 2 && x >= -14 && x <= -6 = Wall
    | y == 2 && x >= -5 && x <= -4 = Ground
    | y == 2 && x >= -3 && x <= -3 = Wall
    | y == 2 && x >= -2 && x <= 1 = Ground
    | y == 2 && x >= 2 && x <= 6 = Wall
    | y == 2 && x >= 7 && x <= 7 = Ground
    | y == 2 && x >= 8 && x <= 10 = Wall
    | y == 3 && x >= -19 && x <= -18 = Wall
    | y == 3 && x >= -17 && x <= -17 = Ground
    | y == 3 && x >= -16 && x <= -16 = Wall
    | y == 3 && x >= -15 && x <= -15 = Ground
    | y == 3 && x >= -14 && x <= -14 = Wall
    | y == 3 && x >= -13 && x <= -11 = Ground
    | y == 3 && x >= -10 && x <= -10 = Wall
    | y == 3 && x >= -9 && x <= -8 = Ground
    | y == 3 && x >= -7 && x <= -7 = Wall
    | y == 3 && x >= -6 && x <= -5 = Ground
    | y == 3 && x >= -4 && x <= 2 = Wall
    | y == 3 && x >= 3 && x <= 4 = Ground
    | y == 3 && x >= 5 && x <= 6 = Wall
    | y == 3 && x >= 7 && x <= 8 = Ground
    | y == 3 && x >= 9 && x <= 9 = Wall
    | y == 4 && x >= -19 && x <= -19 = Ground
    | y == 4 && x >= -18 && x <= -18 = Wall
    | y == 4 && x >= -17 && x <= -15 = Ground
    | y == 4 && x >= -14 && x <= -14 = Wall
    | y == 4 && x >= -13 && x <= -13 = Ground
    | y == 4 && x >= -12 && x <= -12 = Wall
    | y == 4 && x >= -11 && x <= -11 = Ground
    | y == 4 && x >= -10 && x <= -10 = Wall
    | y == 4 && x >= -9 && x <= -8 = Ground
    | y == 4 && x >= -7 && x <= -7 = Wall
    | y == 4 && x >= -6 && x <= 8 = Ground
    | y == 4 && x >= 9 && x <= 9 = Wall
    | y == 5 && x >= -19 && x <= -19 = Ground
    | y == 5 && x >= -18 && x <= -14 = Wall
    | y == 5 && x >= -13 && x <= -11 = Ground
    | y == 5 && x >= -10 && x <= -6 = Wall
    | y == 5 && x >= -5 && x <= -4 = Ground
    | y == 5 && x >= -3 && x <= 3 = Wall
    | y == 5 && x >= 4 && x <= 4 = Ground
    | y == 5 && x >= 5 && x <= 10 = Wall
    | y == 6 && x >= -19 && x <= -19 = Ground
    | y == 6 && x >= -18 && x <= -18 = Wall
    | y == 6 && x >= -17 && x <= -15 = Ground
    | y == 6 && x >= -14 && x <= -14 = Wall
    | y == 6 && x >= -13 && x <= -13 = Ground
    | y == 6 && x >= -12 && x <= -10 = Wall
    | y == 6 && x >= -9 && x <= -8 = Ground
    | y == 6 && x >= -7 && x <= -3 = Wall
    | y == 6 && x >= -2 && x <= -1 = Ground
    | y == 6 && x >= 0 && x <= 3 = Wall
    | y == 6 && x >= 4 && x <= 4 = Ground
    | y == 6 && x >= 5 && x <= 5 = Wall
    | y == 6 && x >= 6 && x <= 9 = Ground
    | y == 6 && x >= 10 && x <= 10 = Wall
    | y == 7 && x >= -19 && x <= -19 = Ground
    | y == 7 && x >= -18 && x <= -18 = Wall
    | y == 7 && x >= -17 && x <= -15 = Ground
    | y == 7 && x >= -14 && x <= -14 = Wall
    | y == 7 && x >= -13 && x <= -13 = Ground
    | y == 7 && x >= -12 && x <= -12 = Wall
    | y == 7 && x >= -11 && x <= -11 = Ground
    | y == 7 && x >= -10 && x <= -10 = Wall
    | y == 7 && x >= -9 && x <= -4 = Ground
    | y == 7 && x >= -3 && x <= -3 = Wall
    | y == 7 && x >= -2 && x <= 2 = Ground
    | y == 7 && x >= 3 && x <= 3 = Wall
    | y == 7 && x >= 4 && x <= 4 = Ground
    | y == 7 && x >= 5 && x <= 5 = Wall
    | y == 7 && x >= 6 && x <= 9 = Ground
    | y == 7 && x >= 10 && x <= 10 = Wall
    | y == 8 && x >= -19 && x <= -17 = Wall
    | y == 8 && x >= -16 && x <= -13 = Ground
    | y == 8 && x >= -12 && x <= -10 = Wall
    | y == 8 && x >= -9 && x <= -9 = Ground
    | y == 8 && x >= -8 && x <= -6 = Wall
    | y == 8 && x >= -5 && x <= -4 = Ground
    | y == 8 && x >= -3 && x <= -3 = Wall
    | y == 8 && x >= -2 && x <= -2 = Ground
    | y == 8 && x >= -1 && x <= 0 = Wall
    | y == 8 && x >= 1 && x <= 2 = Ground
    | y == 8 && x >= 3 && x <= 3 = Wall
    | y == 8 && x >= 4 && x <= 4 = Ground
    | y == 8 && x >= 5 && x <= 6 = Wall
    | y == 8 && x >= 7 && x <= 8 = Ground
    | y == 8 && x >= 9 && x <= 10 = Wall
    | y == 9 && x >= -19 && x <= -19 = Wall
    | y == 9 && x >= -18 && x <= -18 = Ground
    | y == 9 && x >= -17 && x <= -17 = Wall
    | y == 9 && x >= -16 && x <= -16 = Ground
    | y == 9 && x >= -15 && x <= -15 = Wall
    | y == 9 && x >= -14 && x <= -13 = Ground
    | y == 9 && x >= -12 && x <= -12 = Wall
    | y == 9 && x >= -11 && x <= -7 = Ground
    | y == 9 && x >= -6 && x <= -6 = Wall
    | y == 9 && x >= -5 && x <= -5 = Ground
    | y == 9 && x >= -4 && x <= -3 = Wall
    | y == 9 && x >= -2 && x <= -1 = Ground
    | y == 9 && x >= 0 && x <= 0 = Wall
    | y == 9 && x >= 1 && x <= 1 = Ground
    | y == 9 && x >= 2 && x <= 3 = Wall
    | y == 9 && x >= 4 && x <= 5 = Ground
    | y == 9 && x >= 6 && x <= 7 = Wall
    | y == 9 && x >= 8 && x <= 9 = Ground
    | y == 9 && x >= 10 && x <= 10 = Wall
    | y == 10 && x >= -19 && x <= -19 = Wall
    | y == 10 && x >= -18 && x <= -18 = Ground
    | y == 10 && x >= -17 && x <= -17 = Wall
    | y == 10 && x >= -16 && x <= -16 = Ground
    | y == 10 && x >= -15 && x <= -15 = Wall
    | y == 10 && x >= -14 && x <= -14 = Ground
    | y == 10 && x >= -13 && x <= -13 = Storage
    | y == 10 && x >= -12 && x <= -12 = Wall
    | y == 10 && x >= -11 && x <= -11 = Ground
    | y == 10 && x >= -10 && x <= -10 = Wall
    | y == 10 && x >= -9 && x <= -9 = Ground
    | y == 10 && x >= -8 && x <= -8 = Wall
    | y == 10 && x >= -7 && x <= -7 = Ground
    | y == 10 && x >= -6 && x <= -6 = Wall
    | y == 10 && x >= -5 && x <= -1 = Ground
    | y == 10 && x >= 0 && x <= 0 = Wall
    | y == 10 && x >= 1 && x <= 5 = Ground
    | y == 10 && x >= 6 && x <= 6 = Wall
    | y == 10 && x >= 7 && x <= 9 = Ground
    | y == 10 && x >= 10 && x <= 10 = Wall
    | y == 11 && x >= -19 && x <= -17 = Wall
    | y == 11 && x >= -16 && x <= -16 = Ground
    | y == 11 && x >= -15 && x <= -12 = Wall
    | y == 11 && x >= -11 && x <= -7 = Ground
    | y == 11 && x >= -6 && x <= -6 = Wall
    | y == 11 && x >= -5 && x <= -4 = Ground
    | y == 11 && x >= -3 && x <= 0 = Wall
    | y == 11 && x >= 1 && x <= 2 = Ground
    | y == 11 && x >= 3 && x <= 6 = Wall
    | y == 11 && x >= 7 && x <= 8 = Ground
    | y == 11 && x >= 9 && x <= 10 = Wall
    | y == 12 && x >= -19 && x <= -19 = Wall
    | y == 12 && x >= -18 && x <= -11 = Ground
    | y == 12 && x >= -10 && x <= -3 = Wall
    | y == 12 && x >= -2 && x <= -1 = Ground
    | y == 12 && x >= 0 && x <= 3 = Wall
    | y == 12 && x >= 4 && x <= 5 = Ground
    | y == 12 && x >= 6 && x <= 7 = Wall
    | y == 12 && x >= 8 && x <= 9 = Ground
    | y == 12 && x >= 10 && x <= 10 = Wall
    | y == 13 && x >= -19 && x <= -19 = Wall
    | y == 13 && x >= -18 && x <= -16 = Ground
    | y == 13 && x >= -15 && x <= -13 = Wall
    | y == 13 && x >= -12 && x <= 9 = Ground
    | y == 13 && x >= 10 && x <= 10 = Wall
    | y == 14 && x >= -19 && x <= -15 = Wall
    | y == 14 && x >= -14 && x <= -14 = Ground
    | y == 14 && x >= -13 && x <= -13 = Wall
    | y == 14 && x >= -12 && x <= -11 = Ground
    | y == 14 && x >= -10 && x <= 6 = Wall
    | y == 14 && x >= 7 && x <= 8 = Ground
    | y == 14 && x >= 9 && x <= 10 = Wall
    | y == 15 && x >= -19 && x <= -16 = Ground
    | y == 15 && x >= -15 && x <= -10 = Wall
    | y == 15 && x >= -9 && x <= 5 = Ground
    | y == 15 && x >= 6 && x <= 9 = Wall
    | otherwise = Blank





bad_maze_1 = Maze (C 0 0) bad_mazeF_1

bad_mazeF_1 (C x y)
    | y == -3 && x >= -4 && x <= -3 = Ground
    | y == -3 && x >= -2 && x <= 2 = Blank
    | y == -2 && x >= -4 && x <= -3 = Ground
    | y == -2 && x >= -2 && x <= -2 = Wall
    | y == -2 && x >= -1 && x <= -1 = Ground
    | y == -2 && x >= 0 && x <= 0 = Storage
    | y == -2 && x >= 1 && x <= 1 = Ground
    | y == -2 && x >= 2 && x <= 2 = Wall
    | y == -1 && x >= -4 && x <= -2 = Wall
    | y == -1 && x >= -1 && x <= -1 = Ground
    | y == -1 && x >= 0 && x <= 0 = Storage
    | y == -1 && x >= 1 && x <= 1 = Box
    | y == -1 && x >= 2 && x <= 4 = Wall
    | y == 0 && x >= -4 && x <= -4 = Wall
    | y == 0 && x >= -3 && x <= -1 = Ground
    | y == 0 && x >= 0 && x <= 0 = Ground
    | y == 0 && x >= 1 && x <= 3 = Ground
    | y == 0 && x >= 4 && x <= 4 = Wall
    | y == 1 && x >= -4 && x <= -4 = Wall
    | y == 1 && x >= -3 && x <= -3 = Ground
    | y == 1 && x >= -2 && x <= -2 = Box
    | y == 1 && x >= -1 && x <= -1 = Ground
    | y == 1 && x >= 0 && x <= 0 = Wall
    | y == 1 && x >= 1 && x <= 1 = Ground
    | y == 1 && x >= 2 && x <= 2 = Box
    | y == 1 && x >= 3 && x <= 3 = Ground
    | y == 1 && x >= 4 && x <= 4 = Wall
    | y == 2 && x >= -4 && x <= -4 = Wall
    | y == 2 && x >= -3 && x <= -2 = Ground
    | y == 2 && x >= -1 && x <= 1 = Wall
    | y == 2 && x >= 2 && x <= 3 = Ground
    | y == 2 && x >= 4 && x <= 4 = Wall
    | y == 3 && x >= -4 && x <= -1 = Wall
    | y == 3 && x >= 0 && x <= 0 = Ground
    | y == 3 && x >= 1 && x <= 4 = Wall
    | otherwise = Blank

bad_maze_2 = Maze (C 0 0) bad_mazeF_2

bad_mazeF_2 (C x y)
    | y == -1 && x >= -2 && x <= 14 = Wall
    | y == 0 && x >= -2 && x <= -2 = Wall
    | y == 0 && x >= -1 && x <= -1 = Ground
    | y == 0 && x >= 0 && x <= 0 = Ground
    | y == 0 && x >= 1 && x <= 1 = Wall
    | y == 0 && x >= 2 && x <= 3 = Ground
    | y == 0 && x >= 4 && x <= 4 = Wall
    | y == 0 && x >= 5 && x <= 6 = Ground
    | y == 0 && x >= 7 && x <= 7 = Wall
    | y == 0 && x >= 8 && x <= 9 = Ground
    | y == 0 && x >= 10 && x <= 10 = Wall
    | y == 0 && x >= 11 && x <= 13 = Ground
    | y == 0 && x >= 14 && x <= 14 = Wall
    | y == 1 && x >= -2 && x <= -2 = Wall
    | y == 1 && x >= -1 && x <= 0 = Ground
    | y == 1 && x >= 1 && x <= 1 = Wall
    | y == 1 && x >= 2 && x <= 2 = Storage
    | y == 1 && x >= 3 && x <= 3 = Box
    | y == 1 && x >= 4 && x <= 4 = Ground
    | y == 1 && x >= 5 && x <= 5 = Storage
    | y == 1 && x >= 6 && x <= 6 = Box
    | y == 1 && x >= 7 && x <= 9 = Ground
    | y == 1 && x >= 10 && x <= 10 = Wall
    | y == 1 && x >= 11 && x <= 13 = Ground
    | y == 1 && x >= 14 && x <= 14 = Wall
    | y == 2 && x >= -2 && x <= -2 = Wall
    | y == 2 && x >= -1 && x <= -1 = Storage
    | y == 2 && x >= 0 && x <= 0 = Box
    | y == 2 && x >= 1 && x <= 3 = Ground
    | y == 2 && x >= 4 && x <= 4 = Wall
    | y == 2 && x >= 5 && x <= 6 = Ground
    | y == 2 && x >= 7 && x <= 7 = Wall
    | y == 2 && x >= 8 && x <= 8 = Storage
    | y == 2 && x >= 9 && x <= 9 = Box
    | y == 2 && x >= 10 && x <= 13 = Wall
    | y == 2 && x >= 14 && x <= 14 = Wall
    | y == 3 && x >= -2 && x <= -2 = Wall
    | y == 3 && x >= -1 && x <= 0 = Ground
    | y == 3 && x >= 1 && x <= 1 = Wall
    | y == 3 && x >= 2 && x <= 3 = Ground
    | y == 3 && x >= 4 && x <= 4 = Wall
    | y == 3 && x >= 5 && x <= 6 = Ground
    | y == 3 && x >= 7 && x <= 7 = Wall
    | y == 3 && x >= 8 && x <= 9 = Ground
    | y == 3 && x >= 10 && x <= 10 = Wall
    | y == 3 && x >= 11 && x <= 13 = Ground
    | y == 3 && x >= 14 && x <= 14 = Wall
    | y == 4 && x >= -2 && x <= 14 = Wall
    | otherwise = Blank

bad_maze_3 = Maze (C 0 0) bad_mazeF_3

bad_mazeF_3 (C x y)
    | y == -1 && x >= -3 && x <= 4 = Wall
    | y == 0 && x >= -3 && x <= -3 = Wall
    | y == 0 && x >= -2 && x <= -2 = Ground
    | y == 0 && x >= -1 && x <= -1 = Ground
    | y == 0 && x >= 0 && x <= 0 = Box
    | y == 0 && x >= 1 && x <= 3 = Ground
    | y == 0 && x >= 4 && x <= 4 = Wall
    | y == 1 && x >= -3 && x <= -3 = Wall
    | y == 1 && x >= -2 && x <= -2 = Storage
    | y == 1 && x >= -1 && x <= 2 = Wall
    | y == 1 && x >= 3 && x <= 3 = Ground
    | y == 1 && x >= 4 && x <= 4 = Wall
    | y == 2 && x >= -3 && x <= -3 = Wall
    | y == 2 && x >= -2 && x <= -2 = Storage
    | y == 2 && x >= -1 && x <= 1 = Wall
    | y == 2 && x >= 2 && x <= 3 = Ground
    | y == 2 && x >= 4 && x <= 4 = Wall
    | y == 3 && x >= -3 && x <= -3 = Wall
    | y == 3 && x >= -2 && x <= -1 = Ground
    | y == 3 && x >= 0 && x <= 0 = Box
    | y == 3 && x >= 1 && x <= 3 = Ground
    | y == 3 && x >= 4 && x <= 4 = Wall
    | y == 4 && x >= -3 && x <= -3 = Wall
    | y == 4 && x >= -2 && x <= -2 = Ground
    | y == 4 && x >= -1 && x <= -1 = Wall
    | y == 4 && x >= 0 && x <= 0 = Box
    | y == 4 && x >= 1 && x <= 1 = Wall
    | y == 4 && x >= 2 && x <= 3 = Ground
    | y == 4 && x >= 4 && x <= 4 = Wall
    | y == 5 && x >= -3 && x <= -3 = Wall
    | y == 5 && x >= -2 && x <= -1 = Ground
    | y == 5 && x >= 0 && x <= 0 = Box
    | y == 5 && x >= 1 && x <= 2 = Ground
    | y == 5 && x >= 3 && x <= 4 = Wall
    | y == 6 && x >= -3 && x <= 0 = Wall
    | y == 6 && x >= 1 && x <= 2 = Ground
    | y == 6 && x >= 3 && x <= 3 = Wall
    | y == 7 && x >= -3 && x <= -1 = Storage
    | y == 7 && x >= 0 && x <= 3 = Wall
    | otherwise = Blank

bad_maze_4 = Maze (C 0 0) bad_mazeF_4

bad_mazeF_4 (C x y)
    | y == -2 && x >= -4 && x <= -3 = Ground
    | y == -2 && x >= -2 && x <= 2 = Wall
    | y == -1 && x >= -4 && x <= -2 = Wall
    | y == -1 && x >= -1 && x <= 1 = Ground
    | y == -1 && x >= 2 && x <= 5 = Wall
    | y == 0 && x >= -4 && x <= -4 = Wall
    | y == 0 && x >= -3 && x <= -1 = Ground
    | y == 0 && x >= 0 && x <= 0 = Ground
    | y == 0 && x >= 1 && x <= 1 = Ground
    | y == 0 && x >= 2 && x <= 4 = Storage
    | y == 0 && x >= 5 && x <= 5 = Wall
    | y == 1 && x >= -4 && x <= -4 = Wall
    | y == 1 && x >= -3 && x <= -3 = Ground
    | y == 1 && x >= -2 && x <= -2 = Box
    | y == 1 && x >= -1 && x <= -1 = Ground
    | y == 1 && x >= 0 && x <= 0 = Box
    | y == 1 && x >= 1 && x <= 1 = Ground
    | y == 1 && x >= 2 && x <= 3 = Box
    | y == 1 && x >= 4 && x <= 4 = Ground
    | y == 1 && x >= 5 && x <= 5 = Wall
    | y == 2 && x >= -4 && x <= 2 = Wall
    | y == 2 && x >= 3 && x <= 3 = Wall
    | y == 2 && x >= 4 && x <= 4 = Storage
    | y == 2 && x >= 5 && x <= 5 = Blank
    | y == 3 && x >= -4 && x <= 1 = Ground
    | y == 3 && x >= 2 && x <= 5 = Wall
    | otherwise = Blank

bad_maze_5 = Maze (C 0 0) bad_mazeF_5 

bad_mazeF_5 (C x y)
    | y == -4 && x >= -4 && x <= 4 = Wall
    | y == -3 && x >= -4 && x <= -4 = Wall
    | y == -3 && x >= -3 && x <= -1 = Ground
    | y == -3 && x >= 0 && x <= 0 = Wall
    | y == -3 && x >= 1 && x <= 3 = Ground
    | y == -3 && x >= 4 && x <= 4 = Wall
    | y == -2 && x >= -4 && x <= -4 = Wall
    | y == -2 && x >= -3 && x <= -2 = Ground
    | y == -2 && x >= -1 && x <= -1 = Wall
    | y == -2 && x >= 0 && x <= 0 = Ground
    | y == -2 && x >= 1 && x <= 1 = Wall
    | y == -2 && x >= 2 && x <= 3 = Ground
    | y == -2 && x >= 4 && x <= 4 = Wall
    | y == -1 && x >= -4 && x <= -3 = Wall
    | y == -1 && x >= -2 && x <= -2 = Storage
    | y == -1 && x >= -1 && x <= -1 = Wall
    | y == -1 && x >= 0 && x <= 0 = Ground
    | y == -1 && x >= 1 && x <= 1 = Wall
    | y == -1 && x >= 2 && x <= 2 = Storage
    | y == -1 && x >= 3 && x <= 4 = Wall
    | y == 0 && x >= -4 && x <= -4 = Ground
    | y == 0 && x >= -3 && x <= -3 = Wall
    | y == 0 && x >= -2 && x <= -2 = Ground
    | y == 0 && x >= -1 && x <= -1 = Box
    | y == 0 && x >= 0 && x <= 0 = Ground
    | y == 0 && x >= 1 && x <= 1 = Box
    | y == 0 && x >= 2 && x <= 2 = Ground
    | y == 0 && x >= 3 && x <= 4 = Wall
    | y == 1 && x >= -4 && x <= -4 = Ground
    | y == 1 && x >= -3 && x <= -3 = Wall
    | y == 1 && x >= -2 && x <= -2 = Storage
    | y == 1 && x >= -1 && x <= -1 = Wall
    | y == 1 && x >= 0 && x <= 0 = Wall
    | y == 1 && x >= 1 && x <= 1 = Wall
    | y == 1 && x >= 2 && x <= 2 = Storage
    | y == 1 && x >= 3 && x <= 3 = Ground
    | y == 1 && x >= 4 && x <= 4 = Wall
    | y == 2 && x >= -4 && x <= -4 = Ground
    | y == 2 && x >= -3 && x <= -3 = Wall
    | y == 2 && x >= -2 && x <= -2 = Ground
    | y == 2 && x >= -1 && x <= -1 = Box
    | y == 2 && x >= 0 && x <= 0 = Ground
    | y == 2 && x >= 1 && x <= 1 = Box
    | y == 2 && x >= 2 && x <= 3 = Ground
    | y == 2 && x >= 4 && x <= 4 = Wall
    | y == 3 && x >= -4 && x <= -4 = Ground
    | y == 3 && x >= -3 && x <= 1 = Wall
    | y == 3 && x >= 2 && x <= 3 = Ground
    | y == 3 && x >= 4 && x <= 4 = Wall
    | y == 4 && x >= -4 && x <= 0 = Ground
    | y == 4 && x >= 1 && x <= 4 = Wall
    | otherwise = Blank

bad_maze_6 = Maze (C 0 0) bad_mazeF_6

bad_mazeF_6 (C x y)
    | y == -1 && x >= -6 && x <= -6 = Ground
    | y == -1 && x >= -5 && x <= 1 = Wall
    | y == 0 && x >= -6 && x <= -5 = Wall
    | y == 0 && x >= -4 && x <= -4 = Ground
    | y == 0 && x >= -3 && x <= -3 = Storage
    | y == 0 && x >= -2 && x <= -1 = Ground
    | y == 0 && x >= 0 && x <= 0 = Ground
    | y == 0 && x >= 1 && x <= 1 = Wall
    | y == 1 && x >= -6 && x <= -6 = Wall
    | y == 1 && x >= -5 && x <= -4 = Ground
    | y == 1 && x >= -3 && x <= -3 = Wall
    | y == 1 && x >= -2 && x <= -2 = Ground
    | y == 1 && x >= -1 && x <= -1 = Wall
    | y == 1 && x >= 0 && x <= 0 = Ground
    | y == 1 && x >= 1 && x <= 1 = Wall
    | y == 2 && x >= -6 && x <= -6 = Wall
    | y == 2 && x >= -5 && x <= -5 = Ground
    | y == 2 && x >= -4 && x <= -4 = Box
    | y == 2 && x >= -3 && x <= -3 = Wall
    | y == 2 && x >= -2 && x <= -2 = Box
    | y == 2 && x >= -1 && x <= 0 = Ground
    | y == 2 && x >= 1 && x <= 1 = Wall
    | y == 3 && x >= -6 && x <= -5 = Wall
    | y == 3 && x >= -4 && x <= -4 = Ground
    | y == 3 && x >= -3 && x <= -3 = Wall
    | y == 3 && x >= -2 && x <= -1 = Ground
    | y == 3 && x >= 0 && x <= 1 = Wall
    | y == 4 && x >= -6 && x <= -6 = Ground
    | y == 4 && x >= -5 && x <= -5 = Wall
    | y == 4 && x >= -4 && x <= -4 = Ground
    | y == 4 && x >= -3 && x <= -3 = Wall
    | y == 4 && x >= -2 && x <= -2 = Ground
    | y == 4 && x >= -1 && x <= 0 = Wall
    | y == 5 && x >= -6 && x <= -6 = Ground
    | y == 5 && x >= -5 && x <= -5 = Wall
    | y == 5 && x >= -4 && x <= -2 = Ground
    | y == 5 && x >= -1 && x <= -1 = Wall
    | y == 6 && x >= -6 && x <= -6 = Ground
    | y == 6 && x >= -5 && x <= -1 = Wall
    | otherwise = Blank

bad_maze_7 = Maze (C 0 0) bad_mazeF_7

bad_mazeF_7 (C x y)
    -- | y == -5 && x >= -3 && x <= -3 = Ground
    | y == -5 && x >= -2 && x <= 2 = Wall
    | y == -4 && x >= -3 && x <= -2 = Wall
    | y == -4 && x >= -1 && x <= 1 = Wall
    | y == -4 && x >= 2 && x <= 2 = Wall
    | y == -3 && x >= -3 && x <= -3 = Wall
    | y == -3 && x >= -2 && x <= -2 = Ground
    | y == -3 && x >= -1 && x <= -1 = Storage
    | y == -3 && x >= 0 && x <= 0 = Wall
    | y == -3 && x >= 1 && x <= 1 = Box
    | y == -3 && x >= 2 && x <= 2 = Wall
    | y == -2 && x >= -3 && x <= -3 = Wall
    | y == -2 && x >= -2 && x <= -2 = Ground
    | y == -2 && x >= -1 && x <= -1 = Storage
    | y == -2 && x >= 0 && x <= 1 = Ground
    | y == -2 && x >= 2 && x <= 3 = Wall
    | y == -1 && x >= -3 && x <= -3 = Wall
    | y == -1 && x >= -2 && x <= -2 = Ground
    | y == -1 && x >= -1 && x <= -1 = Storage
    | y == -1 && x >= 0 && x <= 0 = Wall
    | y == -1 && x >= 1 && x <= 1 = Box
    | y == -1 && x >= 2 && x <= 2 = Ground
    | y == -1 && x >= 3 && x <= 3 = Wall
    | y == 0 && x >= -3 && x <= -2 = Wall
    | y == 0 && x >= -1 && x <= -1 = Ground
    | y == 0 && x >= 0 && x <= 0 = Ground
    | y == 0 && x >= 1 && x <= 2 = Ground
    | y == 0 && x >= 3 && x <= 3 = Wall
    | y == 1 && x >= -3 && x <= -3 = Ground
    | y == 1 && x >= -2 && x <= -2 = Wall
    | y == 1 && x >= -1 && x <= -1 = Ground
    | y == 1 && x >= 0 && x <= 0 = Wall
    | y == 1 && x >= 1 && x <= 1 = Box
    | y == 1 && x >= 2 && x <= 3 = Wall
    | y == 2 && x >= -3 && x <= -3 = Ground
    | y == 2 && x >= -2 && x <= -2 = Wall
    | y == 2 && x >= -1 && x <= 1 = Ground
    | y == 2 && x >= 2 && x <= 2 = Wall
    | y == 3 && x >= -3 && x <= -3 = Ground
    | y == 3 && x >= -2 && x <= 2 = Wall
    | otherwise = Blank

bad_maze_8 = Maze (C 0 0) bad_mazeF_8

bad_mazeF_8 (C x y)
    | y == -3 && x >= -4 && x <= -2 = Ground
    | y == -3 && x >= -1 && x <= 2 = Wall
    | y == -2 && x >= -4 && x <= -4 = Ground
    | y == -2 && x >= -3 && x <= -1 = Wall
    | y == -2 && x >= 0 && x <= 1 = Ground
    | y == -2 && x >= 2 && x <= 3 = Wall
    | y == -1 && x >= -4 && x <= -4 = Ground
    | y == -1 && x >= -3 && x <= -3 = Wall
    | y == -1 && x >= -2 && x <= -2 = Ground
    | y == -1 && x >= -1 && x <= -1 = Box
    | y == -1 && x >= 0 && x <= 0 = Ground
    | y == -1 && x >= 1 && x <= 1 = Box
    | y == -1 && x >= 2 && x <= 2 = Ground
    | y == -1 && x >= 3 && x <= 3 = Wall
    | y == 0 && x >= -4 && x <= -3 = Wall
    | y == 0 && x >= -2 && x <= -2 = Storage
    | y == 0 && x >= -1 && x <= -1 = Wall
    | y == 0 && x >= 0 && x <= 0 = Ground
    | y == 0 && x >= 1 && x <= 1 = Wall
    | y == 0 && x >= 2 && x <= 2 = Storage
    | y == 0 && x >= 3 && x <= 3 = Wall
    | y == 1 && x >= -4 && x <= -4 = Wall
    | y == 1 && x >= -3 && x <= -2 = Ground
    | y == 1 && x >= -1 && x <= -1 = Box
    | y == 1 && x >= 0 && x <= 0 = Ground
    | y == 1 && x >= 1 && x <= 1 = Box
    | y == 1 && x >= 2 && x <= 2 = Ground
    | y == 1 && x >= 3 && x <= 3 = Wall
    | y == 2 && x >= -4 && x <= -4 = Wall
    | y == 2 && x >= -3 && x <= -1 = Ground
    | y == 2 && x >= 0 && x <= 0 = Storage
    | y == 2 && x >= 1 && x <= 2 = Ground
    | y == 2 && x >= 3 && x <= 3 = Wall
    | y == 3 && x >= -4 && x <= -2 = Wall
    | y == 3 && x >= -1 && x <= 0 = Ground
    | y == 3 && x >= 1 && x <= 3 = Wall
    | y == 4 && x >= -4 && x <= -3 = Ground
    | y == 4 && x >= -2 && x <= 1 = Wall
    | otherwise = Blank


