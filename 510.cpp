#include <iostream>
#include <algorithm>
#include <list>

#define INF 100000001
#define mp make_pair

using namespace std;

const int MAXI = 5;

list<pair<int, int> >lst;
pair<int, int> mdn;
list<pair<int, int> >::iterator it;
list<pair<int, int> >::iterator it2;
int a;

list<pair<int, int> > totalList[MAXI];

void printlst()
{
//     cout << "PRINTING LIST\n";
    cout <<"[";
    for(auto tL : totalList)
    {
        cout <<"[";
        for(auto a: tL)
        {
            cout << "(" << a.first << ", " << a.second << "), ";
        }
        cout << "], ";
    }
    cout << "]";
}

int main()
{
    lst.push_front(mp(1,1));
    lst.push_front(mp(0,1));
    
    for(int i=0; i<MAXI; i++)
    {
        it = lst.begin();
        int maxim = lst.size()-1;
        for(int k = 0; k<maxim; k++)
        {
            it2 = it;
            it2++;
            mdn = mp((*it).first + (*it2).first, (*it).second + (*it2).second);
            lst.insert(it2, mdn);
//             cout << "Adding " << "(" << mdn.first << ", " << mdn.second << ") at position " << k << "\n";
            it++;
            it++;
        }
        totalList[i].insert(totalList[i].end(), lst.begin(), lst.end()); 
    }
//     cout << "AA\n";
    printlst();
            
    return 0;
}