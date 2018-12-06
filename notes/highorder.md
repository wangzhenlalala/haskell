# High Order Function
## $ function (function application)
> func argument (function application with space is left associative)

> sum map sqrt [1..3] is error
> sum (map sqrt [1..3]) is ok

> func $ argument (function application with $ is right associative)

> sum $ map sqrt [1..3] is ok

# Lambda
> To make a lambda, we write a \ (because it kind of looks like the greek letter lambda if you squint hard enough) and then we write the parameters, separated by spaces. After that comes a -> and then the function body. We usually surround them by parentheses, because otherwise they extend all the way to the right.
****
> filter (\xs -> length xs > 15) (map chain [1..100])

## lambdas are expressions they return a function 

## Fold (Reduce)
> Folds can be used to implement any function where you traverse a list once, element by element, and then return something based on that. Whenever you want to traverse a list to return something, chances are you want a fold.

# Function composition
> (.) :: (b -> c) -> (a -> b) -> a -> c  
f . g = \x -> f (g x)  

> ghci> map (\xs -> negate (sum (tail xs))) [[1..5],[3..6],[1..7]]  
[-14,-15,-27]

> ghci> map (negate . sum . tail) [[1..5],[3..6],[1..7]]  
[-14,-15,-27]  

> replicate 100 (product (map (*3) (zipWith max [1,2,3,4,5] [4,5,6,7,8])))

> replicate 100 . product . map (*3) . zipWith max [1,2,3,4,5] $ [4,5,6,7,8]