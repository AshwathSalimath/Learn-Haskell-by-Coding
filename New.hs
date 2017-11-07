import Data.List
import System.IO

-- Let's go For Functions as Haskell is a Functional Pro
-- do will chain all commands and store them in main

-- Quit ghci using :q
-- ghc --make name-of-program
-- ./name-of-program

{-
main = do
    putStrLn "What's your Name"
    name <- getLine
    putStrLn ("Hello" ++ name)
-}

addMe :: Int -> Int -> Int

-- funcName param1 param2 = opertions (returned value)

addMe x y = x + y

sumMe x y = x + y

addTuples :: (Int, Int) -> (Int, Int) -> (Int, Int)

addTuples (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- Playing with Functions

whatAge :: Int -> String
whatAge 16 = "You can Drive"
whatAge _ = "You cannot Drive. Sorry."

-- Factorial
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

-- Odd or Even
isOdd :: Int -> Bool
isOdd n
    | n `mod` 2 == 0 = False
    | otherwise = True

isEven n = n `mod` 2 == 0

-- in Functions '|' are called as Guards in if-else loop
whatGrade :: Int -> String
whatGrade age
    | (age >= 0) && (age <= 4) = "Play at Home"
    | (age >= 5) && (age <= 6) = "Kindergarten"
    | (age > 5) && (age <= 10) = "Elementary School"
    | (age > 10) && (age <= 14) = "Middle School"
    | (age > 14) && (age <= 18) = "High School"
    | otherwise = "Go to College"


-- Using 'where' in Functions using Guards
batAvgRating :: Double -> Double -> String

batAvgRating hits atBats
    | avg <= 0.200 = "Terrible Batting Average"
    | avg <= 0.250 = "Average Player"
    | avg <= 0.280 = "You are doing Pretty Good"
    | otherwise = "You're a Superstar"
    where avg = hits / atBats

-- Accessing List Items in Functions
getListItems :: [Int] -> String
getListItems [] = "Your List is Empty"
getListItems (x:[]) = "Your List starts with " ++ show x
getListItems (x:y:[]) = "Your Lis contains" ++ show x ++ " and " ++ show y
getListItems (x:xs) = "Your First item is " ++ show x ++ " and the rest are " ++ show xs

getFirstItem :: String -> String
getFirstItem [] = "Empty String"
getFirstItem all@(x:xs) = "The First letter in " ++ all ++ " is " ++ show x


-- Higher order Functions
times4 :: Int -> Int
times4 x = x * 4

-- map allows us to apply the Function to every Item in the List
listTimes = map times4 [1, 2, 3, 4, 5]

-- multBy4 takes an Integer List and returns Integer List
-- We cretaed multBy4 Function
multBy4 :: [Int] -> [Int]
multBy4 [] = []
multBy4 (x:xs) = times4 x : multBy4 xs

-- Checking equality of Strings using Recursion
areStringsEq :: [Char] -> [Char] -> Bool
areStringsEq [] [] = True
areStringsEq (x:xs) (y:ys) = x == y && areStringsEq xs ys
areStringsEq _ _ = False

-- Doing Multiplication by passing a Function
doMult :: (Int -> Int) -> Int
doMult func = func 3
num3Times4 = doMult times4

getAddFunc :: Int -> (Int -> Int)
getAddFunc x y =  x + y
adds3 = getAddFunc 3
adds4 = getAddFunc 4
fourPlus3 = adds3 4
threePlusList = map adds3 [1, 2, 3, 4, 5]
fourPlusList = map adds3 [1, 2, 3, 4, 5]


-- Let's go through Lambda
















