a :: (Num p) => p->p
fac x = if x==1 then 1 else x*(fac (x-1))

dig :: Integer->Integer
dig n = if n<10 then n else (n `mod` 10) + dig (n `div` 10)

x20 = dig (fac 100)