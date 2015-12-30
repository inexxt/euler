import Data.Numbers.Primes
import Data.List

createListOfDig :: [Int] -> [Int] -> [Int]
createListOfDig [] ds = ds
createListOfDig (x:xs) ds
    | x == 0 = [0]
    | x < 10 = createListOfDig xs ((x `mod` 10):ds)
    | otherwise = createListOfDig ((x `div` 10):xs) ((x `mod` 10):ds)

toList x = createListOfDig [x] []

listToNum :: [Int] -> Int
listToNum xs = foldl (\x y -> 10*x + y) 0 xs


lst = [(str, str + stp, str + 2*stp) | str <- [1001..9999], stp <- [1..9990], str + 2*stp < 9999, isPrime str, isPrime (str + stp), isPrime (str + 2*stp), arePerms str (str + stp) (str + 2*stp)]
    where arePerms a b c = isPerm a b && isPerm b c
          isPerm a b = (sort $ toList a) == (sort $ toList b)
          
tri = head $ tail lst -- 2969,6299,9629
f (a, b, c) = a
s (a, b, c) = b
t (a, b, c) = c
r49 = listToNum $ (toList (f tri)) ++ (toList (s tri)) ++ (toList (t tri))