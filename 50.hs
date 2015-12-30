import Data.Numbers.Primes
import Data.List
import Data.Ord


pms = primes

longest (acc, ind) pms= if ind>0 then longest ((acc + head pms), ind - 1) (reduce pms) else acc
    where reduce pms = tail pms
          
lst = [(m, acc m n , primes!!n) | n <- [0..50], m <- [501, 503..560], primes!!n * m < 1000000, isPrime $ acc m n, acc m n < 1000000]
    where acc m n = longest (0, m) (drop n primes)
          
chng ls = map (\(x, y, z) -> (x, y)) ls

maxi xs = maximumBy (comparing fst) (chng xs)

r50 = maxi lst