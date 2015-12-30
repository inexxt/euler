divis :: Integer -> Int
divis x = 2*(length [y | y<-[1..round(sqrt(fromIntegral x :: Double))], x `mod` y == 0])

padd (tr, i) = ((tr ++ [((last tr) + i)]), (i+1), divis (last tr))

kl (tr, i, nr) = if nr>500 then tr else kl $ padd (tr, i) 


-- x12 = triangle (head triangleL)

