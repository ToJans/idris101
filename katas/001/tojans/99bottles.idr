-- by Tojans

-- to run this:
-- idris 99bottles.idr
-- > beersong 1
-- > beersong 99
-- > beersong 100 -- throws

beersong : Fin 100 -> String
beersong x = verses x where

    -- invoke this in the CLI using `bottlesofbeer (the (Fin 10) 4)`
    bottlesofbeer : Fin n -> String
    bottlesofbeer fZ      = "No more bottles of beer"
    bottlesofbeer (fS fZ) = "1 bottle of beer"
    bottlesofbeer k       = (show (finToInteger k)) ++ " bottles of beer"


    verse : Fin n -> String 
    verse fZ     = ""
    verse (fS n) = 
        (bottlesofbeer (fS n)) ++ " on the wall,\n" ++
        (bottlesofbeer (fS n)) ++ "\n" ++
        "Take one down, pass it around\n" ++
        (bottlesofbeer n) ++ " on the wall\n"

    verses : Fin n -> String
    verses fZ     = ""
    verses (fS n) = (verse (fS n)) ++ (verses n)