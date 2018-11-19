# Types
## The type of every expression is known at compile time
* :t expression => give you type
```
    > :t (True, 'a')  
    > (True, 'a') :: (Bool, Char)
    ## tuple's type
    ## :: is read as "has type of 
```
* **Functions also have types**
    * 
    ```
        removeNonUppercase :: [Char] -> [Char]  
        removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]  ## infix
    ```
    ```
        addThree :: Int -> Int -> Int -> Int  ## recive more than one parameters
        addThree x y z = x + y + z 
    ```
    **you can always just write the function without it and then check it with :t. ***Functions are expressions too***, so :t works on them without a problem.**
***
* common types
    > types are written in capital case,
    * Int ## Int is bounded, which means that it has a minimum and a maximum value. 
    * Integer ## Integer is not bounded so it can be used to represent really really big numbers. 
    * Float 
    * Double
    * Bool
    * Char
    * **Type variables**
        * What is the type of the head function? Because head takes a list of any type and returns the first element, so what could it be?
        ```
            ghci> :t head  
            head :: [a] -> a  
            ## Functions that have type variables are called polymorphic functions. 
        ```
        ***The type declaration of head states that it takes a list of any type and returns one element of that type.***

# **Typeclass**
```
    ghci> :t (==)  
    (==) :: (Eq a) => a -> a -> Bool 
```
> Everything before the => symbol is called a **class constraint**. We can read the previous type declaration like this: ***the equality function takes any two values that are of the same type and returns a Bool***. The type of those two values must be a member of the Eq class (this was the class constraint).
    
> the equality operator, == is a function. So are +, *, -, / and pretty much all operators. If a function is comprised only of special characters, it's considered an infix function by default. If we want to examine its type, pass it to another function or call it as a prefix function, we have to surround it in parentheses.

## common typeclss
* Eq: is used for types that support equality testing.
* Ord: is for types that have an ordering.
* Show
* Read
    * ***type annotation*** vs ***type infer***
    > why we can use explicit type annotations ? Type annotations are a way of explicitly saying what the type of an expression should be. We do that by adding :: at the end of the expression and then specifying a type.
    ```
        ghci> read "5" :: Int
        ghci> read "[1,2,3,4]" :: [Int]  
        ghci> read "(3, 'a')" :: (Int, Char)  
    ```
## Haskell is a statically typed language, it has to know all the types before the code is compiled (or in the case of GHCI, evaluated).
* Enum
* Bounded
* Num: is a numeric typeclass. Num includes all numbers, including real numbers and integral numbers,
* Integral: includes only integral (whole) numbers
* Float