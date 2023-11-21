
module Types where
import CodeWorld
 
type MazeMap = Coord -> Tile 

-- data Maze = Maze Coord (Coord -> Tile)

-- instance Eq Maze where f == f' = and [f (C x y ) == f' C(x y) | x <- [-10 .. 10], y <- [-10..10]]


data Tile = Wall | Ground | Storage | Box | Blank deriving Eq

eq :: Tile -> Tile -> Bool
eq a b = a == b

data Direction = R | U | L | D deriving Eq
data Coord = C Int Int deriving (Eq, Show)
data Maze = Maze{initialPos ::  Coord, f :: MazeMap }
data Pos = P {coord :: Coord, dir :: Direction}
-- data Maze = M {playerPos :: Coord, boxesPos :: [Coord], f :: MazeMap} 

instance Eq Maze where (Maze a b) == (Maze a' b') =  and [b  (C x y) == b' (C x y) | x <- [-10 .. 10], y <- [-10 .. 10]]


data State = S {
  stPlayer :: Coord,
  stDir    :: Direction,
  stBoxes  :: [Coord], 
  stMap    :: Maze,
  stXdim   :: [Integer],
  stYdim   :: [Integer],
  stLevel  :: Integer,
  stMove   :: Integer,
  levels   :: [Maze]
} deriving Eq

data Activity world = Activity {
  actState  :: world,
  actHandle :: (Event -> world -> world),
  actDraw   ::(world -> Picture)
  }

data SSState world = StartScreen | Running world

data WithUndo a = WithUndo a [a]