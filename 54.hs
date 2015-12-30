import Data.List

data Value = One | Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Queen | King | Ace deriving (Eq, Ord, Show)
data Suit = H | C | D | S deriving (Eq, Ord, Show)
data Card = Card (Value v, Suit c) deriving (Eq, Ord, Show)
data Hand = Hand [Card e] deriving (Eq, Ord, Show)
data Row = Row (Hand a, Hand b) deriving (Show)


winner :: Row -> Bool -- determines if first player wins
winner (Hand a, Hand b) = (strength a) > (strength b)

listToNum :: [Int] -> Int
listToNum xs = foldl (\x y -> 10*x + y) 0 xs

allTheSame :: Eq a => [a] -> Bool
allTheSame x:[] = True
allTheSame (x:xs) = if x == head xs then allTheSame xs else False


nElements :: [a] -> Int -> [[a]]
nElements ls n = filter (\xs -> length xs == n) $ concat $ map tails $ inits ls

values hand = map fst
suits hand = map snd

consecutive hand = or [and [elem v elems | v <- (values hand)] | elems <-(nElements alls 5)]
    where alls = [One, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Queen, King, Ace]


rf hand = (allTheSame (suits hand)) && (and [elem v tops | v <- (values hand )])
    where tops = [Ten, Jack, Queen, King, Ace]
    
sf hand = (allTheSame (suits hand)) && (consecutive hand)
    
fk hand = or [allTheSame set | set <-(nElements (values hand) 4)]

fl hand = allTheSame (suits hand)

st hand = consecutive hand

fk hand = or [allTheSame set | set <-(nElements (values hand) 3)]

tp hand = length (filter (==True) [h!!0 == h!!1 | h <-(nElements (values hand), 2)]) == 9

op hand = length (filter (==True) [h!!0 == h!!1 | h <-(nElements (values hand), 2)]) == 7

hc hand = last $ sort hand

listOfCombs = [hc, op, tp, th, st, fl, fh, fk, sf, rf]

strength :: Hand -> Integer
strength hand = [f hand | f <- listOfCombs]





-- strength :: Hand -> Integer
-- strength (Card a, Card b, Card c, Card d, Card e) =     
-- rf (Value v1, Suit c1) (Value v2, Suit c2) (Value v3, Suit c3) (Value v4, Suit c4) (Value v5, Suit c5) = (allTheSame [c1, c2, c3, c4, c5]) && (and [elem v tops | v <- [v1, v2, v3, v4, v5]])
--     where tops = [Ten, Jack, Queen, King, Ace]
