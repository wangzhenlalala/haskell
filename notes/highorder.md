# High Order Function
# Lambda
> To make a lambda, we write a \ (because it kind of looks like the greek letter lambda if you squint hard enough) and then we write the parameters, separated by spaces. After that comes a -> and then the function body. We usually surround them by parentheses, because otherwise they extend all the way to the right.
****
> filter (\xs -> length xs > 15) (map chain [1..100])

## lambdas are expressions they return a function 

## Fold (Reduce)
> Folds can be used to implement any function where you traverse a list once, element by element, and then return something based on that. Whenever you want to traverse a list to return something, chances are you want a fold.