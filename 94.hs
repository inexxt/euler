--mins = sum $ [24*k^4-44*k^3+30*k^2-9*k+1 | k<-[1..], 3*k+1 < 10^9]
is_square n = sq * sq == n
    where sq = floor $ sqrt $ (fromIntegral n::Double)

plus = sum $ [3*k + 1| k<-[1..], 3*k-1 < 10^9, is_square(24*k^4+44*k^3+30*k^2+9*k+1)]

r94 =  plus
