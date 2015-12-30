import Data.Numbers.Primes
import Data.List

nums = [a + 2*b | a<- (take 1000 primes), b<-[a^2 | a<-[1..100]], a + 2*b < 10000]
others = [a | a<-[2..10000], not (isPrime a), a `mod` 2 == 1]

r46 = head (others \\ nums)