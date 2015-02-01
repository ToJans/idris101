## The beersong

From [Rosettacode.org](http://rosettacode.org/wiki/99_Bottles_of_Beer)

In this puzzle, write code to print out the entire "99 bottles of beer on the wall" song.
For those who do not know the song, the lyrics follow this form:
```
X bottles of beer on the wall
X bottles of beer
Take one down, pass it around
X-1 bottles of beer on the wall

X-1 bottles of beer on the wall
...
Take one down, pass it around
0 bottles of beer on the wall
```
----------

Please note that you should replace `bottles` with `bottle` whenever it is appropriate.

## Some hints for the solution

The type `Fin 99`  would probably be sufficient, so you'd have a function like this:

```idris
verse : Fin 99 -> string
verse x = case x of
   0 -> Verse for 0
   1 -> Verse for 1
   _ -> Verse for x
```

If this exercise is too simple, complicate it by adding these posibilities:

```idris
data VerseCount = 
    Verse of Fin 99 
  | CountDown of Fin 99 
  | All 
  | Range of Fin 99 * Fin 99`  -- where the first parameter is smaller then the last
```

Ofc this will not compile, but I'd assume you'd get the picture....
