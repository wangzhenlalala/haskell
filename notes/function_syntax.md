# pattern matching
    *  patterns will be checked from top to bottom and when it conforms to a pattern, the corresponding function body will be used.
    * always include a catch-all pattern so that our program doesn't crash
# Whereas patterns are a way of making sure a value conforms to some form and deconstructing it
# Guards are a way of testing whether some property of a value (or several of them) are true or false.
* If all the guards of a function evaluate to False (and we haven't provided an otherwise catch-all guard), evaluation falls through to the next pattern. That's how patterns and guards play nicely together. If no suitable guards or patterns are found, an error is thrown.

* Since we repeat the same expression three times, it would be ideal if we could calculate it once, bind it to a name and then use that name instead of the expression.

# Binding
## where bindings
## let bindings 
 * name (specific type)
 * expression
 * value
 * calculate
 * **bind values to names**

 * The form is let ```<bindings>``` in ```<expression>```. The names that you define in the let part are accessible to the expression after the in part.

 * Let bindings let you bind to variables ***anywhere*** and are ***expressions*** themselves, but are very local, so they don't span across guards.


 ```
 ghci> [let square x = x * x in (square 5, square 3, square 2)] 
 [(25,9,4)]

 ghci> (let a = 100; b = 200; c = 300 in a*b*c, let foo="Hey "; bar = "there!" in foo ++ bar)  
 (6000000,"Hey there!")

 -- They're very useful for quickly dismantling a tuple into components and binding them to names and such.
 ghci> (let (a,b,c) = (1,2,3) in a+b+c) * 100  
 600
 ```


```
 case expression of pattern -> result  
                   pattern -> result  
                   pattern -> result  
                   ...  
```