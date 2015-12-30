f 1 = 1
f n = (f (n-1)) + 2*ceiling((n-1)/4)

size = 1001*2 - 1
r28 = sum [n | n <- map f [1..size]] 