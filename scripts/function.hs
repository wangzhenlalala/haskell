-- c++ 里面的函数的重载吗？？
-- 模式的匹配，是因为有了 静态的类型 才可能的吗？？

lucky :: (Integral a) => a -> String
lucky  6 =  "LUCKY NUMBER"
lucky x = "sorry! you are out of luck"

sayMe :: (Integral a) => a -> String
sayMe 1 = "One"
sayMe 2 = "Two"
sayMe 3 = "Three"
sayMe 4 = "Four"
sayMe x = "Not between 1 - 4"

-- 阶乘：
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial x = x * factorial (x - 1)

-- always include a catch-all pattern so that our program doesn't crash

addVector :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVector (x1, y1) (x2, y2) = (x1+x2, y1+y2)

-- _ means do not bind the name, i do not care about it
first :: (a, b, c) -> a  
first (x, _, _) = x  
  
second :: (a, b, c) -> b  
second (_, y, _) = y  
  
third :: (a, b, c) -> c  
third (_, _, z) = z  

-- we take the list apart by splitting it into a head and a tail.

tell :: (Show a) => [a] -> String  
tell [] = "The list is empty"  
tell (x:[]) = "The list has one element: " ++ show x  
-- tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y // -- Pattern match is redundant
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y  
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y


length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs


sum' :: (Num a) => [a] -> a  
sum' [] = 0  
sum' (x:xs) = x + sum' xs

-- Those are a handy way of breaking something up according to a pattern and binding it to names whilst still 
-- keeping a reference to the whole thing. 
capital :: String -> String  
capital "" = "Empty string, whoops!"  
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]  


-- otherwise is defined simply as otherwise = True and catches everything. 
bmiTell :: (RealFloat a) => a -> String
bmiTell bmi
    | bmi <= 18.5 = "under weight"
    | bmi <= 25.0 = "normal weight"
    | bmi <= 30.0 = "over weight"
    | otherwise   = "wow are you a whale !"


-- The names we define in the where section of a function are only visible to that function
bmiTell_1 :: (RealFloat a) => a -> a -> String  
bmiTell_1 weight height  
    | bmi <= skinny = "You're underweight, you emo, you!"  
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"  
    | otherwise     = "You're a whale, congratulations!"  
    where bmi = weight / height ^ 2  
          skinny = 18.5  
          normal = 25.0  
          fat = 30.0 
-- Notice that all the names are aligned at a single column. 
-- If we don't align them nice and proper, Haskell gets confused 
-- because then it doesn't know they're all part of the same block.


-- [ name | bind | expression value ]
initials :: String -> String -> String  
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."  
    where (f:_) = firstname  
          (l:_) = lastname


calcBmis :: (RealFloat a) => [(a, a)] -> [a]  
calcBmis xs = [bmi w h | (w, h) <- xs]  
    where bmi weight height = weight / height ^ 2



-- We include a let inside a list comprehension much like we would a predicate, 
-- only it doesn't filter the list, it only binds to names. 
-- The names defined in a let inside a list comprehension are visible 
-- to the output function (the part before the |) 
-- and all predicates 
-- and sections that come after of the binding

calcBmis_1 :: (RealFloat a) => [(a, a)] -> [a]  
calcBmis_1 xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi >= 25.0] 



describeList :: [a] -> String  
describeList xs = "The list is " ++ case xs of [] -> "empty."  
                                               [x] -> "a singleton list."   
                                              xs -> "a longer list."  


-- pattern matching in function definitions is syntactic sugar for case expressions
describeList1 :: [a] -> String  
describeList1 xs = "The list is " ++ what xs  
    where what [] = "empty."  
          what [x] = "a singleton list."  
          what xs = "a longer list."  