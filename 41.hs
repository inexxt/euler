import Data.Numbers.Primes
import Data.List

createListOfDig :: [Int] -> [Int] -> [Int]
createListOfDig [] ds = ds
createListOfDig (x:xs) ds
    | x == 0 = [0]
    | x < 10 = createListOfDig xs ((x `mod` 10):ds)
    | otherwise = createListOfDig ((x `div` 10):xs) ((x `mod` 10):ds)

-- only to 10e8, because both sum [1..8] and sum [1..9] are divisible by 9
lP = (takeWhile (<10000000) primes) :: [Int]

dl :: Int -> [Int]
dl x = createListOfDig [x] []

lst = [x | x <- lP, sort (dl x) == [1..(length (dl x))] ]

r41 = maximum lst
