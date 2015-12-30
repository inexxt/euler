prime 2 = True
prime x = null [y | y<-[2..x-1], x `mod` y == 0]

c = 600851475143
c' = 1234169
{-primes = take (round (sqrt c) + 10) [1..]-}

x3 = [x | x<-[c'+10, c'+9..1], c `mod` x == 0]
