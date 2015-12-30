-- f 0 _ = 1
-- f _ 0 = 1
-- 
-- f m n = f m (n-1) + f (m-1) n
-- x15 = f 20 20
factorial 1 = 1
factorial n = n * factorial (n-1)

x15 = factorial 40 `div` (factorial 20 * factorial 20)