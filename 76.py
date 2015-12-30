import numpy as np

b = 100
tab = np.zeros((b+1, b+1), int)

def ways(ind, maxind, minval):
  s=0
  x=0
  if (ind == maxind):
    # print(tab)
    return 1
  while(ind + minval <= maxind):
      if not tab[maxind - (ind + minval)][minval]:
        x = ways(ind + minval, maxind, minval)
        tab[maxind - (ind + minval)][minval] = x
      s += tab[maxind - (ind + minval)][minval]
      minval += 1
  return s


a = 0
c = 1
print(a, b, c , ways(a, b, c) - 1)
