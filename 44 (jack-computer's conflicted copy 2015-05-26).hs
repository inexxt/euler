import Math.NumberTheory.Primes.Factorisation
import Data.List

pent = [round (n*(3*n - 1)/2) | n <- [1..]]

lPent = take 6000 pent

-- isPent x = or [(x `mod` ((3*n-1) `div` 2) == 0) && (x `div` (n*(3*n-1) `div` 2) == 1)| n <- (map fst (factorise x)), (3*n - 1) `mod` 2 == 0]
isInt x = x == fromInteger (round x)

isPent x = isInt ((sqrt(24*x' + 1) + 1) / 6)
    where x' = fromIntegral x

prs = [(a, b) | a <- lPent, b <- lPent, a > b, isPent (a-b), isPent (a+b)]

r43 = minimum [abs ((fst a) - (snd a)) | a <- prs]


