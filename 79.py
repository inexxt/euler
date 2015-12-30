import numpy as np

ls = [319,680,180,690,129,620,762,689,762,318,368,710,720,710,629,168,160,689,716,731,736,729,316,729,729,710,769,290,719,680,318,389,162,289,162,718,729,319,790,680,890,362,319,760,316,729,380,319,728,716]

def check(ks, pas):
	while(ks and pas):
		k = ks.pop(0)
		while (k != pas[0] and pas):
			pas.pop(0)
		pas.pop(0)
	return not ks

kss = sorted(list(set(ls)))
print(kss)

pas = str(73162890)

ans = [check(list(str(ks)), list(pas)) for ks in kss]
print(ans)