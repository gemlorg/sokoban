module CodeCLI where

import           System.Console.ANSI
import           System.IO
import           Types




-- import Data.List 
-- import Data.List.Split

doesQuit :: String -> Bool
doesQuit "q"  = True
doesQuit "Ctrl-c" = True
doesQuit _   = False

promptLine :: String -> IO String
promptLine prompt = do
    putStr prompt
    getLine



stringLettering :: String -> Picture
stringLettering s f x y
    | x >= - fromIntegral (length s `div` 2) && x< fromIntegral ((length s) -  (length s `div` 2)) && y == 0 = s!!(fromIntegral x + fromIntegral (length s `div` 2))
    | otherwise = f x y
lettering :: Char -> Picture
lettering s f x y
    | x == 0 && y == 0 = s
    | otherwise = f x y
    
letteringAt :: Integer -> Integer -> Char -> Picture
letteringAt a b s f x y
    | x == a && y == b = s
    | otherwise = f x y



addSpace :: [Char] -> [Char]
addSpace (x:xs) = [x] ++ " " ++ addSpace xs
addSpace [] = []

translated :: Integer -> Integer -> Picture -> Picture
translated x y pic f a b = pic (translatedAll (-x) (-y) f ) (a - x) (b - y)

translatedAll :: Integer -> Integer -> DrawFun ->DrawFun
translatedAll x y f a b = f (a - x) (b - y)


blankDraw :: DrawFun
blankDraw _ _ = ' '

colorStr :: [Char] -> IO ()
colorStr s 
    | s == "P" = do setSGR [SetColor Foreground Vivid Red];putStr s;setSGR [SetColor Foreground Vivid White]
    | s == "$" = do setSGR [SetColor Foreground Vivid Yellow];putStr s;setSGR [SetColor Foreground Vivid White]
    | s == "." = do setSGR [SetColor Foreground Vivid Blue];putStr s;setSGR [SetColor Foreground Vivid White]
    |otherwise = putStr s

printPic :: Picture -> IO ()
-- printPic pic  =  mapM_ putStr [ [(pic  blankDraw) x (-y) | x <- [-20..20]] ++ ['\n'] | y <- [-5..5]]
printPic pic  =  mapM_ (\x -> do colorStr x) [ if x  == 21 then ['\n'] else [(pic  blankDraw) x (-y)]| y <- [-5..5],x <- [-20..21] ]

getKey :: IO [Char]
getKey = reverse <$> getKey' ""
  where getKey' chars = do
          char <- getChar
          more <- hReady stdin
          (if more then getKey' else return) (char:chars)

activityOf :: world -> (Event -> world -> world) -> (world -> Picture) -> IO ()
activityOf state0 handle draw = do
    hSetBuffering stdin NoBuffering
    hSetBuffering stdout NoBuffering
    
    putStr "\ESCc"
    hideCursor
    setSGR [SetConsoleIntensity BoldIntensity]
    printPic (draw state0)
    input <- getKey
    
    let state' = handle (KeyPress input) state0

    if doesQuit  input
     then do 
        showCursor
        return ()
     else 
        -- putStr "\ESCc"
        -- printPic (draw state0)
        activityOf state' handle draw 






-- activityOf state0 handle draw = loop state0 where
--     loop state = do
--         let picture = draw state
--         clearScreen
--         display picture
--         event <- getKey
--         let state' = handle event state
--         loop state'
