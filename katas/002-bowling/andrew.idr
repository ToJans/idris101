scoreGame : List Int -> Int
scoreGame xs = score xs 0 where
  score : List Int -> Int -> Int
  score _              10 = 0
  score (10::x::y::xs) f  = 10 + x + y + (score (x::y::xs) (f + 1))
  score (x::y::z::xs)  f  = let t = x + y in
    if t == 10 then
      x + y + z + (score (z::xs) (f + 1))
    else
      x + y + (score (z::xs) (f + 1))
  score (x::y::xs) f      = x + y + (score xs (f + 1))

perfect : Int
perfect = scoreGame [10,10,10,10,10,10,10,10,10,10,10,10] 

nines : Int
nines = scoreGame [9,0,9,0,9,0,9,0,9,0,9,0,9,0,9,0,9,0,9,0]

spares : Int
spares = scoreGame [5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5]
