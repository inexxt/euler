import Data.Ord
import Data.List

maxn = 500

lst'' n = [(0, 1)] ++ [(a, b) | a<-[1..n], b<-[1..n], a<b] ++ [(1,1)]
lst' = [lst'' n | n<-[maxn..maxn]] :: [[(Double, Double)]]

customSort = sortBy (comparing (\(x,y) -> x/y))

lst = map (nub.(map floorOnPair)) (map customSort lst')
    where floorOnPair (x, y) = (gc x y, gc y x)
          gc a b = (floor a) `div` (gcd (floor a) (floor b)) 

dens = [[d*d | (_, d) <-l] | l<-lst]

trips ls = [ (ls!!a, ls!!(a+1), ls!!(a+2)) | a <- [0..(length ls)-3]]

tripsMod'' ls = [(gc b c, gc a c, gc a b) | (a,b,c) <- ls]
    where gc a b = (a*b) `div` (gcd a b) 

res'' = map (tripsMod''.trips) dens

gcdt :: Integral a => (a,a,a) -> a
gcdt (a, b, c) = gcd (gcd a b) c 

modt :: Integral a => (a,a,a) -> (a,a,a) -> (a,a,a)
modt (a1,b1,c1) (a2, b2, c2) = ((a1 `mod` a2), (b1 `mod` b2), (c1 `mod` c2 ))

modt' (a2, b2, c2) (a1,b1,c1) = ((a1 `mod` a2), (b1 `mod` b2), (c1 `mod` c2 ))

pap n xs = [(a,b,c) | (a,b,c)<-xs, a<=n, c<=n, a<=c, b<a, b<c]
phnb n = map (pap n) res''
ph n = concat $ map nub (phnb n)

phmodt' [] res = res
phmodt' (x:xs) res = phmodt' [ p | p <-xs, modt p x /= (0,0,0)] (x:res) 
          
phmodt n = phmodt' (ph n) [] 

maxt n = [ ((maximum [a,b,c]), sum [a,b,c]) | (a,b,c) <- (phmodt n)]
sumt n = [s*(n `div` f)*(n `div` f+1)`div`2 | (f, s)<- maxt n]
-- shmap n xs = [a+b+c | (a,b,c)<-xs, a<=n, c<=n, a<=c]
-- sh' n = map (shmap n) res''

-- sh n = nub $ concat (sh' n)

s n = sum $ sumt n