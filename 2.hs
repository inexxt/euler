fib xs 0 = xs
fib xs acc = fib (xs ++ [last (init xs) + last xs]) (acc-1)

x2 = sum [x | x <-(fib [1,1] 1000), even x, x<4000000]