import Data.Numbers.Primes
import Data.List

maxn = 1000000
createListOfDig :: Int -> [Int] -> [Int]
createListOfDig 0 ds = ds
createListOfDig x ds
    | x == 0 = []
    | x < 10 = ((x `mod` 10):ds)
    | otherwise = createListOfDig (x `div` 10) ((x `mod` 10):ds)

listToNum :: [Int] -> Int
listToNum xs = foldl (\x y -> 10*x + y) 0 xs

lP = takeWhile (<1000000) primes
inits_p p = filter (>0) (map listToNum (inits $ createListOfDig p []))
tails_p p = filter (>0) (map listToNum (tails $ createListOfDig p []))
kps ps = foldr (\x y -> (isPrime x) && y) True ps

r37' = [p | p <- lP, kps $ inits_p p, kps $ tails_p p]          

r37 = (sum r37') - sum [2,3,5,7]