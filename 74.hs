import Data.Set hiding (map)

factorials = [1,1,2,6,24,120,720,5040,40320,362880]
factorial x = factorials!!x

foldfactorial x = if x > 0 then (factorial (x `mod` 10)) + (foldfactorial (x `div` 10)) else 0

chain x st p = 
	if p == 0 then True else 
	if member newx st then False
	else chain newx (insert newx st) (p-1)
	where newx = foldfactorial x

r74 = length [x | x <- [1..1000000], chain x (empty) 59]