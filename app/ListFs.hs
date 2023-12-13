module ListFs where

import Data.Foldable


elemList :: Eq a => a -> [a] -> Bool
elemList _ [] = False
elemList e (x:xs) = (x == e) || elemList e xs

appendList :: [a] -> [a] -> [a]
appendList [] a = a
appendList (x:xs) a = x: appendList xs a

listLength :: [a] -> Integer
listLength = foldr (\ x -> (+) 1) 0

filterList :: (a -> Bool) -> [a] -> [a]
filterList f l = [e | e <- l, f e]

nth :: [a] -> Integer -> a
nth _ i | i < 0 = error " Index should be positive"
nth [] _ = error "Index out of range"
nth (x:xs) i = if i == 0 then x else nth xs (i-1)

mapList :: (a -> b) -> [a] -> [b]
mapList f l = [f x | x <- l]

andList :: [Bool] -> Bool
andList [] = True 
andList (x:xs) = x && andList xs

allList :: (a-> Bool) -> [a] -> Bool
allList f l = andList $ mapList f l

foldList :: (a -> b -> b) -> b -> [a] -> b
foldList _ z [] = z
foldList f z (x:xs) = f x (foldList f z xs)

isGraphClosed :: Eq a => a -> (a -> [a]) -> (a -> Bool) -> Bool
isGraphClosed initial neighbours isOk = allList isOk $ reachableFrom initial neighbours []

reachable :: Eq a => a -> a -> (a -> [a]) -> Bool
reachable v initial neighbours = elemList v  ( reachableFrom initial neighbours [])


allReachable :: Eq a => [a] -> a -> (a -> [a]) -> Bool
allReachable vs initial neighbours = allList (\x -> elemList x  ( reachableFrom initial neighbours [])) vs



reachableFrom :: Eq a => a -> (a ->[a]) -> [a] -> [a]
reachableFrom v neighbours visited
      | v `elem` visited = visited
      | otherwise = foldr (\n acc -> reachableFrom n neighbours acc) (v : visited) (neighbours v)
