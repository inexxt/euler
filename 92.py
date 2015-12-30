def squares(num):
	s = 0
	for d in str(num):
		s += int(d)*int(d)
	return s 

# def deduce(num):
# 	if(num == 1):
# 		return 1
# 	if(num == 89):
# 		return 89
# 	return deduce(squares(num))

def deduce(num):
	l = []
	while(num != 1 and num != 89):
		num = squares(num)
		if(num < 10000000):
			if(p[num] > 0):
				num = p[num]
				# print(num)
			l.append(num)
	for i in l:
		p[i] = num
	return num

il = 0
p = [0] * 10000000
for i in xrange(9999999):
	if(i % 100000 == 0):
		print(i)
	if(deduce(i+1) == 89):
		il += 1

print(il)
