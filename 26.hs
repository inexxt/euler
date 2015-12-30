ds = [ division d 1 [] | d <- [1..1000]]

fs = [ snd a | a <- ds, fst a == 982]

division d act ls = if ((act*10) `mod` d) `elem` ls then (length ls, d) else division d ((act*10) `mod` d) (((act*10) `mod` d):ls)