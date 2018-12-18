import Data.Char
-- getContent is lazy
main = do 
    contents <- getContents
    putStrLn $ map toUpper contents