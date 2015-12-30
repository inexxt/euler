import Data.Numbers.Primes
import Data.List

listToNum :: [Int] -> Int
listToNum xs = foldl (\x y -> 10*x + y) 0 xs

pans = permutations [0..9]
lst = map (map listToNum) [[take 3 (drop k p) | k <- [1..7]] | p<-pans]

odps = map and (map (zipWith (\a b -> b `mod` a == 0) (take 7 primes)) lst)

k = filter (snd) (zip pans odps)

r43 = sum $ map (listToNum.fst) k