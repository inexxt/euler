import Data.Numbers.Primes
import Data.List


lP x = takeWhile (< (ceiling $ sqrt $ fromIntegral x + 1)) [2..]

listOfDivs :: Int -> [Int] -> [Int]
listOfDivs _ [] = [1]
listOfDivs x (p:ps)
    | x `mod` p == 0 = p:((x `div` p):(listOfDivs x ps))
    | otherwise = listOfDivs x ps
    
abd = [x | x <- [1..20161], (sum $ nub ( listOfDivs x (lP x))) > x]

sumsabd = nub [x+y | x<-abd, y<-abd, x+y < 25000, x<=y]

r23 = [1..25000] \\ sumsabd