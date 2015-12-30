from collections import OrderedDict
import numpy as np

intToRomanT = OrderedDict()

intToRomanT[1000] = "M"
intToRomanT[900] = "CM"
intToRomanT[500] = "D"
intToRomanT[400] = "CD"
intToRomanT[100] = "C"
intToRomanT[90] = "XC"
intToRomanT[50] = "L"
intToRomanT[40] = "XL"
intToRomanT[10] = "X"
intToRomanT[9] = "IX"
intToRomanT[5] = "V"
intToRomanT[4] = "IV"
intToRomanT[1] = "I"


def intToRoman(a):
 

    s = ""
    while a > 0:
        for k in intToRomanT:
            ap, r = divmod(a, k)
            # print(a, k, ap, r, s)
            s += ap*intToRomanT[k]
            a = r
    return s

def romanToInt(s):
    romanToIntT = OrderedDict()
    for k, v in intToRomanT.items():
        romanToIntT[v] = k
    if not s:
        return 0
    if s[0:2] in romanToIntT:
        return romanToIntT[s[0:2]] + romanToInt(s[2:])
    else:
        # print(s[0])
        return romanToIntT[s[0]] + romanToInt(s[1:])


def test():
    print(romanToInt("MXXXI"))
    print(intToRoman(1506))

fname = "p089_roman.txt"
l = [line.rstrip('\n') for line in open(fname)]

# print([romanToInt(x) for x in l])

print(sum([len(x) - len(intToRoman(romanToInt(x))) for x in l]))