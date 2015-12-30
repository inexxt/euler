import numpy as np

name = "p082_matrix.txt" 
# name = "p082_test2.txt"

# def rd(level, index):
# 	if level > 0:
# 		return [(level, index)] + rd(level-1, road[level][index])
# 	else:
# 		return [(level, index)]

def paths(row, to_column):
	sms = []
	for from_column in range(0, N):
		if from_column > to_column:
			s = sum(l[row][(to_column+1):(from_column+1)])
		# print("Dla (",row,")(",to_column,") sumuje od ",from_column, " wyszlo ", sum(l[row][from_column:to_column]))
		else:
			s = sum(l[row][from_column:to_column])
		# sms.append((s + mins[row-1][from_column], to_column))
		sms.append(s + mins[row-1][from_column])
	return sms

l = np.loadtxt(name, delimiter=",", dtype=int)
N = len(l)
l = l.transpose()
mins = np.zeros(l.shape, dtype=int)
road = np.zeros(l.shape, dtype=int)

for i in range(0, N):
	mins[0][i] = l[0][i]

# print(" L: ")
# print(l)
# print(" MINS: ")
# print(mins)


for row in range(1, N):
	for to_column in range(0, N):
		# x = min(paths(row, to_column))
		# mins[row][to_column] = x[0] + l[row][to_column]
		# road[row][to_column] = x[1]
		mins[row][to_column] = min(paths(row, to_column))+ l[row][to_column]
print(min(mins[N-1]))


# r = list(reversed(rd(N-1, mins[N-1].argmin())))
# s = 0
# for v in r:
# 	s  = s + l[v[0]][v[1]]

# print(mins[N-1]) 
# print(r)

	