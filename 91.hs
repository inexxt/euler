import Data.List

isRight (x, y, z) = small*mid/2 - (heron small mid large) < eps && abs(heron small mid large) > eps
--isRight (x, y, z) = (small*small, mid*mid, large*large)
	where 
		small = minimum ls
		mid = (sum ls) - small - large
		large = maximum ls
		ls = [a, b, c]
		a = len x y
		b = len x z
		c = len y z
		heron a b c = sqrt $ p*(p-a)*(p-b)*(p-c)
			where p = (a+b+c)/2 
		eps = 0.000001

len (x1, y1) (x2, y2) = sqrt $ (x1-x2)*(x1-x2) + (y1-y2)*(y1-y2)
r91a t = [(isRight ((0,0), (x1,y1), (x2,y2)), ((0,0), (x1,y1), (x2,y2))) | x1<-[0..t], x2<-[0..t], y1<-[0..t], y2<-[0..t], len (0,0) (x1, y1) > len (0,0) (x2, y2), x1-x2 /= y1-y2]
r91b t = [(isRight ((0,0), (x1,y1), (y1,x1)), ((0,0), (x1,y1), (y1,x1))) | x1<-[0..t], y1<-[0..t]]
a t = (length $ filter (fst) $ r91a t)
b t = (length $ filter (fst) $ r91b t)
c t = (a t) + (div (b t) 2)
--r91r = zip (map isRight (r91 2)) (r91 2)