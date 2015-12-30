--repunit k = let repunit' k l = repunit' k ((last l * k):l)
--	in repunit' k [1]
import Data.Set hiding (foldr, map)
import Data.List (inits)

sqrtx = 1000000 

repunit k = [(k^n-1) `div` (k-1)| n<-[3..]]

repunits x = takeWhile (/=[1]) [takeWhile (<x) $ repunit k | k<-[2..sqrtx]] --x = 10e12, k<10e6

sets x = map fromList (repunits x)

sumOfSets s (ssingles, spairs) = ((s  `union` ssingles) `difference` npairs, npairs)
	where npairs = spairs `union` (s `intersection` ssingles)

sums x = (foldr (sumOfSets) (head $ sets x, fromList []) (tail $ sets x))

r346 x = 1 + (sum.toList $ (Data.Set.filter (\y -> y+1< x) (fst $ sums x)) `union` (snd $ sums x))