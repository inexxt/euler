createListOfDig [] ds = ds
createListOfDig (x:xs) ds
    | x == 0 = [0]
    | x < 10 = createListOfDig xs ((x `mod` 10):ds)
    | otherwise = createListOfDig ((x `div` 10):xs) ((x `mod` 10):ds)

toList x = createListOfDig [x] []

d x count = if (length $ toList count) <= x then d (x-(length $ toList count)) (count+1) else (toList count)!!x

r40 = product [d (10^x) 0 | x<-[0..6]]