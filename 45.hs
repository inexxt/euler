import Math.NumberTheory.Primes.Factorisation
import Data.List

maxn = 100000

tri = [(n*(n + 1) `div` 2) | n <- [1..]]
lTri = take maxn tri

hex = [n*(2*n -1) | n <- [1..]]
lHex = take maxn hex

isPent x = isInt ((sqrt(24*x' + 1) + 1) / 6)
    where x' = fromIntegral x
          isInt x = x == fromInteger (round x)

-- isHex x = or [(x `mod` (2*n-1) == 0) && (x `div` (n*(2*n-1)) == 1)| n <- (map fst (factorise x))]
isHex x = x `elem` lHex
a = [p | p<-lTri, isHex p, isPent p] --VERY ineffective, since hex are tri... well, it worked anyway
r45 = 1533776805