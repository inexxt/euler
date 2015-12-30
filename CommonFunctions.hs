module CommonFunctions where

--import Math.NumberTheory.Primes
--import Math.NumberTheory.Primes.Factorisation
--import Data.List
--import Data.Matrix

createListOfDig :: [Integer] -> [Integer] -> [Integer]
createListOfDig [] ds = ds
createListOfDig (x:xs) ds
    | x == 0 = [0]
    | x < 10 = createListOfDig xs ((x `mod` 10):ds)
    | otherwise = createListOfDig ((x `div` 10):xs) ((x `mod` 10):ds)

toList :: Integer -> [Integer]
toList x = createListOfDig [x] []

fromList :: [Integer] -> Integer
fromList xs = foldl (\x y -> 10*x + y) 0 xs

isPalindrome :: Integer -> Bool
isPalindrome x = x == ((fromList.reverse.toList) x)

if_square :: Integer -> Bool
if_square x = ((floor $ sqrt xi)*(floor $ sqrt xi) == x && x > 1)  
		where xi = fromIntegral x

allTheSame :: (Eq a) => [a] -> Bool
allTheSame xs = and $ map (== head xs) (tail xs)
