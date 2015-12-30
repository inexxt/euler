import Data.Numbers.Primes
import Data.List

n = 15499
m = 94744
conseqPower = ([] :) . concatMap (tail . inits) . tails --helper function, creates all subsets of a set
q p t c = (product $ map (\x -> 1 - 1/(fromIntegral x)) p) * ((a*(f p)) / (a*(f p) - 1))^c - n/m < 0 -- c is for debugging - controlling if we are interested in phi only or in n/n-1 too, a = fromIntegral t is just to have Integers everywhere
	where 
		f x = fromIntegral $ product x 
		a = fromIntegral t
x = conseqPower (take 30 primes)
l = sort $ filter snd $ concat $ [ map (\x -> ((t *(product x), x, length x, t), q x t 1)) x | t<-[1..10]] -- t from 1 to 10 is enough, but may not be if n,m are different
r243 = head $ l -- first number is the answer