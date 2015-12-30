lst1 = [(x,y,y,z) | x <- [0..9], y <- [0..9], z <- [0..9], x /= y, y /= z, z /= x]
lst2 = [(y,x,z,y) | x <- [0..9], y <- [0..9], z <- [0..9], x /= y, y /= z, z /= x]

d a b = 10*a + b

p1 = [(x,y,y,z) | (x,y,_,z) <- lst1, x/z == (d x y)/(d y z)]
p2 = [(y,x,z,y) | (y,x,z,_) <- lst1, x/z == (d y x)/(d z y)]

p = p1 ++ p2
pl = [(d a b) | (a,b,c,dd) <- p]
pd = [(d c dd) | (a,b,c,dd) <- p]

r33 = 1/((product pl) / (product pd))