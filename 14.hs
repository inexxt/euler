chain :: Integer -> Integer -> Integer
chain x lng
    | x==1 = lng
    | even x = chain (x `div` 2) (lng+1) 
    | otherwise = chain (3*x+1) (lng+1)

        
-- maximum' :: [(Integer, Integer)] -> (Integer, Integer)
-- maximum' (x:[]) = x
-- maximum' (x:xs) = if x > (maximum' xs) then x else maximum' xs
-- 
-- x14 :: (Integer, Integer)
-- x14 = maximum' cnp

-- cnp :: [(Integer, Integer)]
-- cnp = [(chain p 1, p) | p<-[1..(1000000-1)]]
cnp = head [p | p<-[1..(1000000-1)], (chain p 1) == 525]

