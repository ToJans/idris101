import Data.Vect
import Data.Fin

data Frames = Strike Frames 
           | Start
           | Pins Int Int Frames
           | Spare Int Frames
           | End  

parsePins : Char -> Int --Fin 10
parsePins '-' = 0 -- FZ
parsePins '1' = 1
parsePins '2' = 2
parsePins '3' = 3
parsePins '4' = 4
parsePins '5' = 5
parsePins '6' = 6
parsePins '7' = 7
parsePins '8' = 8
parsePins '9' = 9

parse : List Char -> Frames
parse ('X'::cs)     = Strike (parse cs)
parse (c::'/'::cs)  = Spare (parsePins c) (parse cs)
parse (x::y::cs)    = Pins (parsePins x) (parsePins y) (parse cs)
parse []            = End

score : Frames -> Int -> Int -> Int
score (Strike frames) m1 m2             = m1 * 10 + (score frames 2 2) 
score (Spare pins frames) m1 m2         = 10 + m1 * pins + (score frames 2 1)
score (Pins roll1 roll2 frames) m1 m2   = m1 * roll1 + m2 * roll2 + (score frames 1 1)
score End _ _                           = 0

scoreGame : String -> Int
scoreGame game = score (parse (unpack game)) 1 1 
--scoreGame game = score . parse . unpack (game 1 1) --game . unpack . parse . score

-- Rolls

-- data Frame = FStrike Int Int
--            | FSpare Int
--            | FPins Int
-- 
-- scoreFrame : Frame -> Int
-- scoreFrame (FStrike x y) = 10 + x + y
-- scoreFrame (FSpare x)    = 10 + x
-- scoreFrame (FPins x)     = x

--scorePins : Vect n Frame -> Int
--scorePins frames = s

