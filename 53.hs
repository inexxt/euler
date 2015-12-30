f :: Integer -> Integer
f 0 = 1
f n = n*(f (n-1))

c n r = (f n) `div` ((f r)*(f (n-r)))

ls = sum [1 | n <- [1..100], r <-[1..n], (c n r) > 10^6]