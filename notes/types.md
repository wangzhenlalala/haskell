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