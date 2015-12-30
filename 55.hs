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

isPalindrome x = x == ((fromList.reverse.toList) x)

-- DEBUG
-- isLychrel' 51 xs _ = xs
-- isLychrel' a xs x = if (isPalindrome x) && (a /= 0) then xs else isLychrel' (a+1) (x:xs) (x + ((fromList.reverse.toList) x)) 
-- 
-- r55' = map (isLychrel' 0 []) [1..10000]

isLychrel 50 _ = True
isLychrel a x = if (isPalindrome x) && (a /= 0) then False else isLychrel (a+1) (x + ((fromList.reverse.toList) x))

r55 = length $ filter (isLychrel 0) [1..10000]
