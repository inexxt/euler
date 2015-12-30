nums10 = map length ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]

nums100= map length ["", "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

-- parseNum :: Int -> (Int, Int, Int)
-- parseNum 1000 = (11, 0, 0)
-- parseNum x = (ty, hundreds, andy)
parseNum :: Int -> Int
parseNum 1000 = 11
parseNum x = ty + hundreds + andy
    where
        hundreds = if x > 99 then (7 + nums10 !! (x `div` 100)) else 0
        andy = if x > 99 && x `mod` 100 /= 0 then 3 else 0
        ty | x `mod` 100 < 20 = nums10 !! (x `mod` 100)
           | otherwise = (nums100 !! ((x `mod` 100) `div` 10)) + (nums10 !! (x `mod` 10))

x17 = sum [ parseNum x| x<-[1..1000]]
