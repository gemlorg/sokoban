module Types where

data Tile = Wall | Ground | Storage | Box | Blank deriving Eq
data Direction = R | U | L | D
data Coord = C Int Int deriving Show

data Pos = P {coord :: Coord, dir :: Direction}

data State = S {
  stPlayer :: Coord,
  stDir    :: Direction,
  stBoxes  :: [Coord],
--   stMap    :: MazeMap,
  stXdim   :: [Integer],
  stYdim   :: [Integer],
  stLevel  :: Integer,
  stMove   :: Integer
}
