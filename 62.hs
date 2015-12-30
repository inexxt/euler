createListOfDig :: [Integer] -> [Integer] -> [Integer]
createListOfDig [] ds = ds
createListOfDig (x:xs) ds
    | x == 0 = [0]
    | x < 10 = createListOfDig xs ((x `mod` 10):ds)
    | otherwise = createListOfDig ((x `div` 10):xs) ((x `mod` 10):ds)

dl :: Integer -> [Integer]
dl x = createListOfDig [x] []

areDigitallyEqal :: Integer -> Integer -> Bool
areDigitallyEqal x y = arePermutations (dl x) (dl y)

arePermutations xs ys = and [ (length $ filter (==x) xs) == (length $ filter (==x) ys) | x<-xs] && and [ (length $ filter (==y) xs) == (length $ filter (==y) ys) | y<-ys]

ran x = [floor $ (10^((fromIntegral (length $ dl (x^3))) - 1))**(1/3)..floor $ (10^(fromIntegral (length $ dl (x^3))))**(1/3)]

lst = [0..]

lx1 = [(x, [y | y<-ran x, areDigitallyEqal (x*x*x) (y*y*y), x<y || x==y]) | x<-lst]
lx2 = [fst e | e<-lx1, (length $ snd e) == 5] 