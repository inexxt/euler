prime 2 = True
prime x = null [y | y<-[2..sx], x `mod` y == 0]
    where sx = floor (sqrt (fromIntegral x :: Double))

x10 = sum $ takeWhile (<2000000) ([x | x<-[2..], prime x] :: [Integer])

