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
dbl1To10 = map (\x -> x * 2) [1 .. 10]

-- Conditionals
-- < > <= >= == /=
--  && || not

-- Using if else in Haskell
doubleEvenNumber y =
    if (y `mod` 2 == 0)
        then y * 2
        else y

-- Using case statements like switch case statements
getClass :: Int -> String
getClass n = case n of
    5 -> "Go to Kindergarten"
    6 -> "Go to elementary school"
    _ -> "Go away"

-- A module will contain bunch of Functions

-- How Enumerations work
data BaseballPlayer = Pitcher
                    | Catcher
                    | Infielder
                    | Outfield
                   deriving Show

barryBonds :: BaseballPlayer -> Bool
barryBonds Outfield = True

barryInOF = print(barryBonds Outfield)

-- Let's go for Custom Data Types
data Customer = Customer String String Double
    deriving Show

tomSmith :: Customer
aSalimat :: Customer
tomSmith = Customer "Tom Smith" "123 Main" 20.50
aSalimat = Customer "Ashwath Salimath" "456 North" 400.87

getBalance :: Customer -> Double
getBalance (Customer _ _ b) = b

getName :: Customer -> String
getName (Customer a _ _) = a

-- Let's play Rock Paper Scissors
data RPS = Rock | Paper | Scissors

shoot :: RPS -> RPS -> String
shoot Paper Rock = "Paper beats Rock"
shoot Rock Scissors = "Rock beats Scissors"
shoot Scissors Paper = "Scissors beat Paper"
shoot Scissors Rock = "Scissors Loses to Rock"
shoot Paper Scissors = "Paper Loses to Scissors"
shoot Rock Paper = "Rock Loses to Paper"
shoot _ _ = "Error"

--
data Shape = Circle Float Float Float | Rectangle Float Float Float Float
    deriving Show

area :: Shape -> Float
area (Circle _ _ r) = pi * r ^ 2
-- area (Rectangle x1 y1 x2 y2) = (abs (x2 - x1)) * (abs (y2 - y1))
-- $ symbol is used to get rid of Parentheses
area (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)


-- Let's code about Dot operator
sumValue = putStrLn (show (1 + 2))
sumValue2 = putStrLn . show $ 1 + 2

areaOfCircle = area (Circle 50 60 20)
areaOfRectangle = area $ Rectangle 10 10 100 100

-- Using (+)
data Employee = Employee {name :: String,
                           position :: String,
                           idNum :: Int
                           } deriving (Eq, Show)

samSmith = Employee {name = "Sam Smith", position = "Manager", idNum = 123}
pamMarx = Employee {name = "Pam Marx", position = "Sales Executive", idNum = 456 }

isSamPam = samSmith == pamMarx

samSmithData = show samSmith

{--- Let's Override Eq and Show Type Class
data ShirtSize = S | M | L

instance Eq ShirtSize where
    S == S = True
    M == M = True
    L == L = True
    _ == _ = False

instance Show ShirtSize where
    show S = "Small"
    show M = "Medium"
    show L = "Large"

smallAvail = S `elem` [S, M, L]
theSize = show S-}

-- Creating Custom Type Classes
class MyEq a where
    areEqual :: a -> a -> Bool

data ShirtSize = S | M | L

instance MyEq ShirtSize where
    areEqual S S = True
    areEqual M M = True
    areEqual L L = True
    areEqual _ _ = False

newSize = areEqual M M

-- Let's go through IO , do helps us to chain commands
sayHello = do
    putStrLn "What's your Name "
    name <- getLine
    putStrLn $ "Hello " ++ name

--Let's go through File IO
writeToFile = do
    theFile <- openFile "test.txt" WriteMode
    hPutStrLn theFile $ "Random Line of Text"
    hClose theFile

readFromFile = do
    theFile2 <- openFile "test.txt" ReadMode
    contents <- hGetContents theFile2
    putStrLn contents
    hClose theFile2

-- Last thing, Let's Implement Fibonacci Series
fib = 1 : 1 : [a + b | (a, b) <- zip fib (tail fib)]

-- take 20 fib


























