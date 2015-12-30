import Data.List

dig_perms = [(tajnafunkcja' $ f $ concat $ [merge_rpn d o | d<-(permutations [a,b,c,d]), o<-ope_perms], [a,b,c,d]) | a<-l, b<-l, c<-l, d<-l, a<b, b<c, c<d]
	where 
		l = map show [1..9]
		f x = sort $ filter (>0) $ map (wywalwszystkienieinty) $ map (solveRPN.(intercalate " ")) $ x
ope_perms = [[x,y,z] | x<-ops, y<-ops, z<-ops]
	where ops = ["+", "-", "*", "/"]


tajnafunkcja acc pop [] = acc
tajnafunkcja acc pop (x:xs)
	| x == (pop+1) = tajnafunkcja (acc+1) x xs
	| x == pop = tajnafunkcja acc x xs
	| otherwise = acc

tajnafunkcja' xs = if last xs < 50 then 0 else tajnafunkcja 0 (if head xs == 0 then 0 else 1) xs 
wywalwszystkienieinty = (\x -> if isAlmostInt x && x >= 0 then fromIntegral $ round x else 0)
merge_rpn [a,b,c,d] [x,y,z] = [[a,b,x,c,d,y,z], [a,b,c,d,x,y,z], [a,b,c,x,d,y,z], [a,b,x,c,y,d,z]]
--merge_rpn [a,b,c,d] [x,y,z] = [[a,b,x,c,y,d,z]]

r93 = maximum dig_perms


isAlmostInt :: Double -> Bool
isAlmostInt x = abs (x - (fromIntegral (round x))) < 0.00001

-- LYAH uses `(Num a) => String -> a` as the signature
solveRPN xs = head $ foldl (\acc x -> foldingFunction acc x) [] $ words xs

foldingFunction acc elem 
 | isOp elem  = calculate (take 2 acc) elem : (drop 2 acc)
 | otherwise  = (read elem) : acc 

calculate (y:x:_) op
 | op == "+" =  x + y
 | op == "-" =  x - y
 | op == "*" =  x * y
 | op == "/" =  if y /= 0 then x / y else 0

isOp x = x `elem` ["+", "-", "*", "/"]


--isInt x = x == fromInteger (round x)
