c = 10001-1

prime 2 = True
prime x = null [y | y<-[2..sx], x `mod` y == 0]
    where sx = floor (sqrt (fromIntegral x :: Double))


x7 = [x | x<-[2..], prime x] !! c