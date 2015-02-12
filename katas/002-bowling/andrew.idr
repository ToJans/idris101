scoreGame : List Int -> Int
scoreGame xs = score xs where
  score : List Int -> Int
  score []                =   0
  score (x::y::[])        =   x + y   
  score (x::y::z::[])     =   x + y + z
  score (x::y::z::xs)     =     
    if x == 10 then           x + y + z + (score (y::z::xs)) 
    else if x + y == 10 then  x + y + z + (score (z::xs))    
    else                      x + y +     (score (z::xs))    
  score (x::y::xs)        =   x + y +     (score xs)         

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
