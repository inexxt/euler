p = (sort (permutations [0..9]))!!999999
r24 = foldr (\x y -> 10*y + x) 0 (reverse p)
