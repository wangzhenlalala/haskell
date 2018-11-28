sum (
    takeWhile   (<10000) 
                (filter odd 
                        (map (^2) 
                             [1..]
                        )
                )
    )

chain :: (Integral a) => a -> [a]  
chain 1 = [1]  
chain n  
    | even n =  n:chain (n `div` 2)  
    | odd n  =  n:chain (n*3 + 1)  

-- just a name to bind a expression
numLongChains :: Int  
numLongChains = length (filter isLong (map chain [1..100]))  
    where isLong xs = length xs > 15 
    

numLongChains' :: Int  
numLongChains' = length (filter (\xs -> length xs > 15) (map chain [1..100]))  

--use lambda is more readable
flip' :: (a -> b -> c) -> b -> a -> c  
flip' f = \x y -> f y x 


map' :: (a -> b) -> [a] -> [b]  
map' f xs = foldr (\x acc -> f x : acc) [] xs  