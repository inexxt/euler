import Data.List


allTheSame :: (Eq a) => [a] -> Bool
allTheSame xs = and $ map (== head xs) (tail xs)

createListOfDig :: [Int] -> [Int] -> [Int]
createListOfDig [] ds = ds
createListOfDig (x:xs) ds
    | x == 0 = [0]
    | x < 10 = createListOfDig xs ((x `mod` 10):ds)
    | otherwise = createListOfDig ((x `div` 10):xs) ((x `mod` 10):ds)

toList x = createListOfDig [x] []

r52 = head [a  | a<-[1..], allTheSame [sort $ toList (n*a) |  n <- [1..6]] ]