createListOfDig :: [Integer] -> [Integer] -> [Integer]
createListOfDig [] ds = ds
createListOfDig (x:xs) ds
    | x == 0 = [0]
    | x < 10 = createListOfDig xs ((x `mod` 10):ds)
    | otherwise = createListOfDig ((x `div` 10):xs) ((x `mod` 10):ds)

toList x = createListOfDig [x] []

r56 = maximum [sum (toList (a^b)) | a<-[10..99], b<-[50..99]]