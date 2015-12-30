createListOfDig :: [Integer] -> [Integer] -> [Integer]
createListOfDig [] ds = ds
createListOfDig (x:xs) ds
    | x == 0 = [0]
    | x < 10 = createListOfDig xs ((x `mod` 10):ds)
    | otherwise = createListOfDig ((x `div` 10):xs) ((x `mod` 10):ds)

toList :: Integer -> [Integer]
toList x = createListOfDig [x] []

fromList :: [Integer] -> Integer
fromList xs = foldl (\x y -> 10*x + y) 0 xs



if_square :: Integer -> Bool
if_square x = ((floor $ sqrt xi)*(floor $ sqrt xi) == x && x > 1)  
		where xi = fromIntegral x

cubes = [x^3 | x<-[2..]]

pals x = [fromList $ (toList a) ++ (reverse $ toList a) | a<-[1..x]] ++ [fromList $ (toList a) ++ [s] ++ (reverse $ toList a) | a<-[1..x], s<-[0..9]]

ways p = length [1 | c<-(takeWhile (<p) cubes), if_square (p- c)]

ans = take 5 [p | p <- pals 10000, ways p == 4] 

