import Math.NumberTheory.Primes.Factorisation
import Data.List

pent = [round (n*(3*n - 1)/2) | n <- [1..]]

lPent = take 1000 pent

isPent x = or [x `mod` ((3*n-1) `div` 2) == 0 | n <- (map fst (factorise x)), (3*n - 1) `mod` 2 == 0]
prs = [(a, b) | a <- lPent, b <- lPent, a /= b, isPent $ abs (a-b), isPent $ abs (a+b)]

lst = sort [(abs ((fst a) - (snd a)), a) | a <- prs]


