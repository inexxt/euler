import Data.List
import Data.Ord

pyt m n = (m^2 - n^2, 2*m*n, m^2 + n^2)

lst = take 1000 [pyt n m | m <- [1..100], n <-[1..100], (gcd m n) == 1, m `mod` 2 /= n `mod` 2, m < n]

sms = map (\(x,y,z) -> x + y + z) lst

ll = [sum [1 | p<-sms , q `mod` p == 0] | q <- [1..1000]]

maxi xs = maximumBy (comparing fst) (zip xs [0..])

r39 = (maxi ll) + 1