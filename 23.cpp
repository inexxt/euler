#include <cstdio>

using namespace std;

const int MAXN = 20162;
const int STEPSN = 4994;
bool a[MAXN];

int steps[STEPSN];

int main()
{
    for(int i=0; i<STEPSN; i++)
    {
        scanf("%d", &steps[i]);
//         printf("%d\n", i);
    }
    for(int i=0; i<MAXN; i++) a[i] = false;
    for(int i=0; i<STEPSN; i++)
    {
        for(int j=0; j<STEPSN; j++)
        {
            if(steps[i] + steps[j] < MAXN)
                a[steps[i] + steps[j]] = true;
        }
    }
    long long int sum = 0;
    for(int i=0; i<MAXN; i++)
    {
        if(!a[i])
        {
            sum += i;
            printf("%d\n", i);
        }
    }
    printf("%lld", sum);
}