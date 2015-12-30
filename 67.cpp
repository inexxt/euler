#include <iostream>

using namespace std;

const int MAXN = 15;
int heap[MAXN][MAXN];
int maxh[MAXN][MAXN];

void printmx()
{
    for(int a = 0; a<MAXN; a++)
    {
        for(auto b: maxh[a])
        cout << b << " ";
        cout << "\n";
    }
}
int main()
{
    int k = 0;
    for(int i=0; i<MAXN; i++)
    {
        for(int j=0; j<=i; j++)
        {
            cin >> heap[i][j];
            cout << k++ << "\n";
        }
    }

    for(int i=MAXN-2; i>=0; i--)
    {
        for(int j=i; j>=0; j--)
        {
            maxh[i][j] = max(maxh[i+1][j] + heap[i+1][j], maxh[i+1][j+1] + heap[i+1][j+1]);
        }
        printmx();
    }
    cout << maxh[0][0] + heap[0][0];
}
