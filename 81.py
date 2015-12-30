import numpy as np

# name = "p081_matrix.txt" 
# name = "p81_test2.txt"

def norm(x):
	if (x >= 0 and x<=N):
		return x
	else:
		return -1

l = np.loadtxt(name, delimiter=",")
l = l.transpose()
N = len(l)-1

maxes = np.empty(l.shape, int)

maxes[0][0] = l[0][0]

for s in xrange(1, 2*l.shape[0]-1):
	for j in range(0, s+1):
		if j <= N and s-j <= N:
			w = norm(j-1)
			k = norm(s-j-1)
			m1 = 100000000
			m2 = 100000000
			if(w >= 0):
				# print("being in", j, s-j, "trying from", w, s-j)
				m1 = maxes[w][s-j]
			if(k >= 0):
				m2 = maxes[j][k]
				# print("being in", j, s-j, "trying from", j, k)
			maxes[j][s-j] = min(m1, m2) + l[j][s-j]
print(maxes[N][N])
