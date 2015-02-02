-- by Tojans



-- This works, but to be correct I should also use `Fin n` in the other functions
beersong : Fin 100 -> String
beersong n = verses (finToInteger n) where

    bottlesofbeer : Integer -> String
    bottlesofbeer 0 = "No more bottles of beer"
    bottlesofbeer 1 = "1 bottle of beer"
    bottlesofbeer n = (show n) ++ " bottles of beer"

    verse : Integer -> String 
    verse n = 
        (bottlesofbeer n) ++ " on the wall,\n" ++
        (bottlesofbeer n) ++ "\n" ++
        "Take one down, pass it around\n" ++
        (bottlesofbeer (n - 1)) ++ " on the wall\n"

    verses : Integer -> String
    verses 0 = ""
    verses n = (verse n) ++ (verses (n - 1)) 




