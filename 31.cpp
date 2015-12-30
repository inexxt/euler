#include <iostream>
#include <set>
#include <map>
#include <typeinfo>

using namespace std;
const int MAXN = 200;
const int NUM_COINS = 8;

int a[NUM_COINS] = {1, 2, 5, 10, 20, 50, 100, 200};

set<map<int, int> > cns[MAXN+1];
map<int, int> ept;

int factorial(int n)
{
  return (n == 1 || n == 0) ? 1 : factorial(n - 1) * n;
}

void add(int coin, int place)
{
    map<int, int> m;
    if(place - coin >= 0)
    {
        for(auto pm: cns[place - coin])
        {

            m = pm;
            m[coin]++;
            cns[place].insert(m);
        }
        cout << coin << " " << place << " "<< cns[place].size() << "\n";
    }
}

int main()
{
    for(int i: a)
    {
        ept[i] = 0;
    }

    cns[0].insert(ept);

    for(int place=1; place<=MAXN; place++)
    {
        for(int coin: a)
        {
            add(coin, place);
        }
    }
    int sum = 0;
    for(auto m: cns[MAXN])
    {
        int temp = 0;
        for(auto coin_num: m)
        {
            temp += coin_num.second;
        }
        temp = factorial(temp);
        for(auto coin_num: m)
        {
            temp /= factorial(coin_num.second);
        }
        sum += temp;
    }
    cout << cns[MAXN].size();
    return 0;
}
