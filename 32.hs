import Data.List

czt = [1000..9999]

listOfDivs :: Int -> [Int] -> Int -> [Int]
listOfDivs x ys ind
    | ind == x = ys
    | x `mod` ind == 0 = listOfDivs x (ind:ys) (ind+1)
    | otherwise = listOfDivs x ys (ind+1)

listOD x = listOfDivs x [] 2

createListOfDig :: [Int] -> [Int] -> [Int]
createListOfDig [] ds = ds
createListOfDig (x:xs) ds
    | x < 10 = createListOfDig xs ((x `mod` 10):ds)
    | otherwise = createListOfDig ((x `div` 10):xs) ((x `mod` 10):ds)

lD2 = [(x, [a | a <- listOD x, (a < 100 && a > 10) || (a < 10), diff a x]) | x <- czt]
    where diff a x
                | a `mod` 10 == a `div` 10 = False
                | a `elem` [0,1,5] = False
                | otherwise = True

trians = [(x, a, x `div` a) | (x, as) <- lD2, a <- as]
llsts = [x | (x, a, b) <- trians, length ( nub $ createListOfDig [x,a,b] []) == 9 && not (0 `elem` createListOfDig [x,a,b] []) ]

r32 = sum $ nub llsts