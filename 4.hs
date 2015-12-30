
isPalindrome [] = True
isPalindrome (x:[]) = True
isPalindrome (x:xs) = if (x == last xs) then isPalindrome (init xs) else False

x4' = filter isPalindrome $ map show [p*q | p<-[100..999], q<-[100..999]]
x4 = maximum [p | p<-x4', read p > 580085]

