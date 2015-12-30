import Data.List

listToNum :: [Int] -> Int
listToNum xs = foldl (\x y -> 10*x + y) 0 xs

pans = permutations [1..9]

allTheSame :: (Eq a) => [a] -> Bool
allTheSame xs = and $ map (== head xs) (tail xs)

case1 = [2,2,2,3] :: [Int]
case2 = [3,3,3] :: [Int]
case3 = [4,5] :: [Int]

divide :: [Int] -> [Int] -> [Int] -> [Int]
divide xs [] res = res
divide xs (c:cs) res = divide (drop c xs) cs ((listToNum (take c xs)):res)

lst cs = [reverse $ divide xs cs [] | xs <- pans]

l1 = lst case1
l2 = lst case2
l3 = lst case3
r ls = map (zipWith (\a b -> if b `mod` a == 0 then (b `div` a) else b) [1..(length $ head ls)]) ls

r1 = maximum [zipWith (*) [1..(length case1)] p | p <- (r l1), allTheSame p] -- empty list, so maximum throws an error
r2 = maximum [zipWith (*) [1..(length case2)] p | p <- (r l2), allTheSame p]
r3 = maximum [zipWith (*) [1..(length case3)] p | p <- (r l3), allTheSame p]

r38 = max r2 r3
