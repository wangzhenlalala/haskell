import Data.Char
type Writer a = (a, String)

-- add a certain context to the value
-- every function will receive  value of the original type 
-- but it has to preserve the same context 
-- across function calls

-- and we can impose many conditions and operations within the context !!!
-- such as embellish the result of function, set the error flag to signal the later function 
-- to bypass or terminate the computation stream.

-- this is a  Monad
upCase :: String -> Writer String
upCase str = (map toUpper str, "upCase ")

toWords :: String -> Writer [String]
toWords str = (words str, "toWords ")

-- the identity morphism for our category ??? 
-- why is this the identity morphism ??
return :: a -> Writer a
return x = Writer(x, "")

-- Morphisms from type 𝐴 to type 𝐵 are functions that go from 𝐴 to
-- a type derived from 𝐵 using the particular embellishment.

-- Each Kleisli category defines its own way of composing such morphisms, as well as
-- the identity morphisms with respect to that composition.

(>=>) ::  (a -> Writer b) -> (b -> Writer c) -> (a -> Writer c)
f1 >=> f2 = \x = 
    let (y, s1) = f1 x
        (z, s2) = f2 y 
    in (z, s1 ++ s2)


process :: String -> Writer [String]
process = upCase >=> toWords






