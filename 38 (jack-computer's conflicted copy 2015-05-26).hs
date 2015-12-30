import Data.List

allTheSame :: (Eq a) => [a] -> Bool
allTheSame xs = and $ map (== head xs) (tail xs)

listToNum :: [Int] -> Int
listToNum xs = foldl (\x y -> 10*x + y) 0 xs

pans = permutations [1..9]

case1 = [2,2,2,3] :: [Int]
case2 = [3,3,3] :: [Int]

divide :: [Int] -> [Int] -> [Int] -> [Int]
divide xs [] res = res
divide xs (c:cs) res = divide (drop c xs) cs ((listToNum (take c xs)):res)

lst cs = [reverse $ divide xs cs [] | xs <- pans]

l1 = lst case1
l2 = lst case2

r ls = map (zipWith (\a b -> if b `mod` a == 0 then b `div` a else b) [1..(length $ head ls)]) ls

r1 = [p | p <- l1, allTheSame (r l1)]
r2 = [p | p <- l2, allTheSame (r l2)]


