{-
n_dig1000 n = if n > 10^600 then True else False

phi = (1 + sqrt(5))/2
fib x = round $ phi^x/sqrt(5)
least p = if n_dig1000 (fib p) then fib p else least (2*p)

-}

-- done by using wolfram :/
-- too big numbers