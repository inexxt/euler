part [] = []
part (x:xs) = [[x]] ++ part xs

x16 = sum (map read (part (show (2^1000))) :: [Integer])