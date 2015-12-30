partition x acc = if x == 0 then acc else partition (x `div` 10) ((x `mod` 10):acc)

a = [partition p [] | p <- [1..]]

sum5dig lst = [sum (map (^5) p) | p<-lst]

mylist = zip [1..] (sum5dig a)

check = filter (\(x,y) -> if x==y then True else False) (take 1000000 mylist)



x30 = foldr (\(x,y) acc -> x + acc) 0 check
x30' = length check