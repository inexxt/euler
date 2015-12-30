createListOfDig :: [Int] -> [Int] -> [Int]
createListOfDig [] ds = ds
createListOfDig (x:xs) ds
    | x == 0 = [0]
    | x < 10 = createListOfDig xs ((x `mod` 10):ds)
    | otherwise = createListOfDig ((x `div` 10):xs) ((x `mod` 10):ds)

isPalindrome :: [Int] -> Bool
isPalindrome [] = True
isPalindrome (x:xs)
    | length xs > 1 = if x == last xs then isPalindrome (init xs) else False 
    | length xs == 1 = if x == last xs then True else False
    | otherwise = True

toBin :: Int -> [Int] -> [Int]
toBin x ys
    |x > 1 = toBin (x `div` 2) ((x `mod` 2):ys)
    |otherwise = x:ys
    
bothPal = [x | x <- [1..1000000], isPalindrome (createListOfDig [x] []), (isPalindrome (toBin x []))]

r36 = sum bothPal