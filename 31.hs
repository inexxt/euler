zeros = take 300 [0, 0..0]

ways x
    | x == 1 = 1
    | x == 2 = 2
    | x < 5 = (ways (x-1)) + (ways (x-2))
    | x == 5 = 1 + (ways 4) + (ways 3)
    | x < 10 = (ways (x-1)) + (ways (x-2)) + (ways (x-5))
    | x == 10 = 1 + (ways 9) + (ways 8) + (ways 5)
    | x < 20 = (ways (x-1)) + (ways (x-2)) + (ways (x-5)) + (ways (x-10))
    | x == 20 = 1 + (ways (x-1)) + (ways (x-2)) + (ways (x-5)) + (ways (x-10))
    | x < 50 = (ways (x-1)) + (ways (x-2)) + (ways (x-5)) + (ways (x-10)) + (ways (x-20))
    | x == 50 = 1 + (ways (x-1)) + (ways (x-2)) + (ways (x-5)) + (ways (x-10)) + (ways (x-20))
    | x < 100 = (ways (x-1)) + (ways (x-2)) + (ways (x-5)) + (ways (x-10)) + (ways (x-20)) + (ways (x-50))
    | x == 100 = 1 + (ways (x-1)) + (ways (x-2)) + (ways (x-5)) + (ways (x-10)) + (ways (x-20)) + (ways (x-50))
    | x < 200 = (ways (x-1)) + (ways (x-2)) + (ways (x-5)) + (ways (x-10)) + (ways (x-20)) + (ways (x-50)) + (ways (x-100))
    | x == 200 = 1 + (ways (x-1)) + (ways (x-2)) + (ways (x-5)) + (ways (x-10)) + (ways (x-20)) + (ways (x-50)) + (ways (x-100))
    | otherwise = 0