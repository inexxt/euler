from time import time

def rev(x):
    return int(str(x)[::-1])

def Palindrome(x):
    if x == rev(x): return True
    else : return False

def test(x):
    steps = 0
    x += rev(x)
    
    while True :
        if not Palindrome(x):
            steps += 1
        else:
            return False
        if steps > 50 :
            return True
        x += rev(x)


def main():
    starttime = time()
    lychrel = 0
    for i in range(1,10000):
        if test(i):
            lychrel += 1
            print i,
    elapsed = time() - starttime 
    print "The answer is %d found in %f seconds"  %(lychrel,elapsed) 

if __name__ == "__main__":
    main()
