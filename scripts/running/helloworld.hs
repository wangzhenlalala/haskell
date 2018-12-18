-- do is a block not a loop
main = do
    putStrLn "what's your name"
    name <- getLine
    putStrLn ("your name is " ++ name ++ " !")
