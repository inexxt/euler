factorialOfDig :: Integer -> Integer
factorialOfDig x = if x < 10 then fac x else (fac (x `mod` 10)) + factorialOfDig (x `div` 10)
	where fac x = if x == 0 then 1 else x*fac (x-1)


--upper limit from 9!
nums = take 1000000 [1..]

curious = [a | a<-nums, factorialOfDig a == a]

