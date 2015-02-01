-- by Tojans
-- We should somehow limit the parameter to Fin 100
verse : Nat -> String
verse Z  = "0"
verse (S n) = (show (n+1)) ++ (verse n)