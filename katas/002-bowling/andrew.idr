scoreGame : List Int -> Int
scoreGame xs = score xs 0 where
  score : List Int -> Int -> Int
  score _             10  =   0
  score (x::y::z::xs) f   =     
    if x == 10 then           x + y + z + (score (x::y::xs) (f + 1))
    else if x + y == 10 then  x + y + z + (score (z::xs)    (f + 1))
    else                      x + y +     (score (z::xs)    (f + 1))
  score (x::y::xs) f      =   x + y +     (score xs         (f + 1))

--
-- TEST CASES:
--

-- 300 : Int
perfect : Int
perfect = scoreGame [10,10,10,10,10,10,10,10,10,10,10,10] 

-- 90 : Int
nines : Int
nines = scoreGame [9,0,9,0,9,0,9,0,9,0,9,0,9,0,9,0,9,0,9,0]

-- 150 : Int
spares : Int
spares = scoreGame [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5]
