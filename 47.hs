import Math.NumberTheory.Primes.Factorisation

ndivs x = length (factorise x)

r47 = take 1 [x | x<-[1000..], ndivs x == 4, ndivs (x+1) == 4, ndivs (x+2) == 4, ndivs (x+3) == 4]
