e :: Integer -> [(Integer, Integer)]
e m = ((2,1):(take (fromIntegral m) $ concat [[(1, 1), (2*k, 1), (1, 1)] | k<-[1..m]]))

sqrt2 m = ((1,1):[(2, 1) | _<-[1..m]])

r65' = [(odwr (foldr (\x s -> odwr (x `add` s)) (0, 1) (sqrt2 m))) | m <- [1..10]]
r65 :: [(Integer, Integer)]
r65 = num $ [odwr (foldr (\x s -> odwr (x `add` s)) (0, 1) (e m)) | m <-[1..100]]
 
num p = fst p
den p = snd p

add p q = (n `div` (gcd n m), m `div` (gcd n m))
	where 
		n = num p * den q + num q * den p
		m = den p * den q

odwr (a, b) = (b, a)

sumofdigits x = if x == 0 then 0 else (x `mod` 10) + sumofdigits (x `div` 10) 