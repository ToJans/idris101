-- by Tojans

-- to run this:
-- idris 99bottles.idr
-- > beerSong 1
-- > beerSong 99
-- > beerSong 100 -- throws

beerSong : Fin 100 -> String
beerSong x = verses x where

    -- invoke this in the CLI using `bottlesOfBeer (the (Fin 10) 4)`
    bottlesOfBeer : Fin n -> String
    bottlesOfBeer fZ      = "No more bottles of beer"
    bottlesOfBeer (fS fZ) = "1 bottle of beer"
    bottlesOfBeer k       = (show (finToInteger k)) ++ " bottles of beer"


    verse : Fin n -> String 
    verse fZ     = ""
    verse (fS n) = 
        (bottlesOfBeer (fS n)) ++ " on the wall,\n" ++
        (bottlesOfBeer (fS n)) ++ "\n" ++
        "Take one down, pass it around\n" ++
        (bottlesOfBeer n) ++ " on the wall\n"

    verses : Fin n -> String
    verses fZ     = ""
    verses (fS n) = (verse (fS n)) ++ (verses n)