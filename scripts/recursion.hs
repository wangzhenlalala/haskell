maximum' :: (Ord a) => [a] -> a  
maximum' [] = error "maximum of empty list"  
maximum' [x] = x  
maximum' (x:xs)   
    | x > maxTail = x  
    | otherwise = maxTail  
    where maxTail = maximum' xs  



replicate' :: (Num i, Ord i) => i -> a -> [a]  
replicate' n x  
    | n <= 0    = []  
    | otherwise = x:replicate' (n-1) x  


--- we'll implement take. 
--- It takes a certain number of elements from a list. 
--- For instance, take 3 [5,4,3,2,1] will return [5,4,3]. 
--- If we try to take 0 or less elements from a list, we get an empty list. 
--- Also if we try to take anything from an empty list, 1we get an empty list. 
--- Notice that those are two edge conditions right there. So let's write that out:

take' :: (Num i, Ord a) => i -> [a] -> [a]  
take' n _  
    | n <= 0   = []  
take' _ []     = []  
take' n (x:xs) = x : take' (n-1) xs  


reverse' :: [a] -> [a]  
reverse' [] = []  
reverse' (x:xs) = reverse' xs ++ [x]  

-- infinite list
repeat' :: a -> [a]
repeat' x = x:repeat' x

-- take 5 (repeat' 3)
-- replicate 5 3



zip' :: [a] -> [b] -> [(a,b)]  
zip' _ [] = []  
zip' [] _ = []  
zip' (x:xs) (y:ys) = (x,y):zip' xs ys  




elem' :: (Eq a) => a -> [a] -> Bool  
elem' a [] = False  
elem' a (x:xs)  
    | a == x    = True  
    | otherwise = a `elem'` xs 