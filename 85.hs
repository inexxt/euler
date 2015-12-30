r85 = minimum $ filter ((>0).fst) $ concat $ [[(s - (x*(x + a + x `div` a + 1) `div` 4), (div x a, a)) | a<-(divisors x)] | x<-[1..3000]]
	where 
		divisors n = [x | x <- [1..(n-1)], n `rem` x == 0]
		s = 2000000
