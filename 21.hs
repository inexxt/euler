listOfDivs :: Int -> [Int] -> Int -> [Int]

listOfDivs x ys ind
    | ind == x = ys
    | x `mod` ind == 0 = listOfDivs x (ind:ys) (ind+1)
    | otherwise = listOfDivs x ys (ind+1)

pp = [(a, (sum (listOfDivs a [] 1))) | a <- [2..10000], (sum (listOfDivs (sum (listOfDivs a [] 1)) [] 1)) == a]
