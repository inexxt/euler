import qualified Data.Set as Set

a = Set.singleton 0

comb = [(x^y) | x<-[2..100], y<-[2..100]]

lst = foldr Set.insert (Set.singleton 0) comb

x29 = Set.size lst - 1