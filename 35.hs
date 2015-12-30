import Data.Numbers.Primes

maxn = 1000000
createListOfDig :: [Int] -> [Int] -> [Int]
createListOfDig [] ds = ds
createListOfDig (x:xs) ds
    | x == 0 = [0]
    | x < 10 = createListOfDig xs ((x `mod` 10):ds)
    | otherwise = createListOfDig ((x `div` 10):xs) ((x `mod` 10):ds)

listToNum :: [Int] -> Int
listToNum xs = foldl (\x y -> 10*x + y) 0 xs

lP = takeWhile (<100000) primes


isPrime' :: Int -> Bool
isPrime' x = if (sum [1 | p<-lP, (x `mod` p == 0)]) == 1 then True else False

createCircular :: [Int] -> Int -> [[Int]]
-- createCircular list -> level -> list of perms
createCircular _ 0 = []
createCircular (x:xs) l = ((xs ++ [x]):(createCircular (xs ++ [x]) (l-1)))

elemL :: (Eq a) => [a] -> [a] -> Bool
elemL [] _ = False
elemL (x:xs) ys = if x `elem` ys then True else elemL xs ys

makeCirc :: Int -> [[Int]]
makeCirc x = createCircular xs (length xs)
	where xs = createListOfDig [x] []

superPrime :: Int -> Bool
superPrime x = if (elemL [0, 2..8] (createListOfDig [x] [])) || ((sum (createListOfDig [x] [])) `mod` 3 == 0) || x `mod` 5 == 0 then False else foldr (\x y -> (isPrime x) && y) True (map listToNum (makeCirc x))

r35' =[a | a<-[1, 3..maxn-1], superPrime a]
r35 = length r35' + 3