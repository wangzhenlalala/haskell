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
