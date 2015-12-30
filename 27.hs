import Data.Numbers.Primes
import Data.List

primesList = takeWhile (<100000) primes

findIndex' :: Int -> [Int] -> Int -> Int
findIndex' x (y:ys) p
    | ys == [] = 0
    | x == y = p
    | x /= y = findIndex' x ys (p+1)
    
eliminate :: Maybe Int -> Int
eliminate (Just a) = a
eliminate Nothing = 0



fun :: Int -> Int -> Int -> Int
fun a b n = n^2 + a*n + b


--At first I thought that the primes must be consecutive too, so that's why I wrote countPrimes function...
--The countPrimes' function is just showing the results, so that I can debug
-- a -> b -> firstN
-- countPrimesFromA :: Int -> Int -> Int
-- countPrimesFromA a b = if ind /= 0 then countPrimes a b ind 1 else 0
--    where ind = eliminate $ elemIndex b primesList 

-- -- a -> b -> numOfPrevious -> n
-- countPrimes :: Int -> Int -> Int -> Int -> Int
-- countPrimes a b p n = if (nextPrime p) == fun a b n then countPrimes a b (p+1) (n+1) else n
-- 	where nextPrime p = primesList!!(p+1)
-- 
-- -- a -> b -> numOfPrevious -> n
-- countPrimes' :: Int -> Int -> Int -> Int -> [Int] -> [Int]
-- countPrimes' a b p n lst = if (nextPrime p) ==  fun a b n then lst ++ [fun a b n] ++ countPrimes' a b (p+1) (n+1) [] else lst
-- 	where nextPrime p = primesList!!(p+1)		  

-- a -> b -> numOfPrevious -> n
countPrimes'' :: Int -> Int -> Int -> Int
countPrimes'' a b n
	| fun a b n < 2 = n
	| a + b `mod` 2 == 1 = n
	| otherwise = if (eliminate (elemIndex (fun a b n) primesList)) /= 0 then countPrimes'' a b (n+1) else n
		
results = [ (countPrimes'' a b 0, a, b) |a <- [-999, -997..999], b <- (takeWhile (<1000) primes)]


-- binsearch :: (Ord a) => [a] -> a -> Int -> Int -> Maybe Int 
-- binarySearch haystack needle lo hi
-- 	| hi < lo	= Nothing
-- 	| pivot > needle	= binarySearch haystack needle lo (mid-1)
-- 	| pivot < needle	= binarySearch haystack needle (mid+1) hi
-- 	| otherwise	= Just mid
-- 	where
-- 	mid	= lo + (hi-lo) `div` 2
-- 	pivot	= haystack!mid