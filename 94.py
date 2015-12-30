import math
def area(a, b, c):
	p = (a + b + c)/2
	return math.sqrt(p*(p-a)*(p-b)*(p-c))

for i in range(1000000):
	if(float.is_integer(area(i, i, i+1))):
		print(i, i, i+1, area(i, i, i+1))
	if(float.is_integer(area(i, i, i-1))):
		print(i, i, i-1, area(i, i, i-1))