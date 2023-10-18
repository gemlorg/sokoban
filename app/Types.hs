module Types where
import CodeWorld

type Maze = Coord -> Tile

data Tile = Wall | Ground | Storage | Box | Blank deriving Eq

eq :: Tile -> Tile -> Bool
eq a b = a == b

data Direction = R | U | L | D
data Coord = C Int Int deriving Eq

data Pos = P {coord :: Coord, dir :: Direction}
data MazeMap = M {playerPos :: Coord, boxesPos :: [Coord], maze :: Maze}

data State = S {
  stPlayer :: Coord,
  stDir    :: Direction,
  stBoxes  :: [Coord], 
  stMap    :: Maze,
  stXdim   :: [Integer],
  stYdim   :: [Integer],
  stLevel  :: Integer,
  stMove   :: Integer
}

data Activity world = Activity {
  actState  :: world,
  actHandle :: (Event -> world -> world),
  actDraw   ::(world -> Picture)
  }

data SSState world = StartScreen | Running world