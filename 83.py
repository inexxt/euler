import numpy as np
import queue as Q

def up(x, y, N):
	if y > 0:
		return x, (y-1)
	else:
		return x, y

def down(x, y, N):
	if y < N-1:
		return x, (y+1)
	else:
		return x, y

def left(x, y, N):
	if x > 0:
		return (x-1), y
	else:
		return x, y

def right(x, y, N):
	if x < N-1:
		return (x+1), y
	else:
		return x, y

def djikstra(x0, y0, tab):

	q = Q.PriorityQueue()
	N = len(tab)
	lock = np.zeros((N, N), bool) 
	cost = np.zeros((N, N), int)

	q.put((0,(x0,y0)))

	dir_fs = [up, down, left, right] #list of functions getting 4 directions from (x,y)

	while not q.empty():
		k, pos = q.get()
		x, y = pos

		if not lock[x,y]:
			k += tab[x,y]
			cost[x,y] = k
			lock[x,y] = True

			# print("ide do ", x, y," z kosztem ", k)

			dirs = [f(x,y,N) for f in dir_fs] #getting pairs (x,y)
			for d in dirs:
				x, y = d
				if not lock[d]:
					q.put((k, (x,y)))
	return cost

if __name__ == "__main__":
	name = "p083_matrix.txt"
	tab = np.loadtxt(name, delimiter=",", dtype=int)
	tab = tab.transpose()

	cost = djikstra(0, 0, tab)

	N = len(tab)
	# print(tab)
	# print(cost) 
	print(cost[N-1][N-1])