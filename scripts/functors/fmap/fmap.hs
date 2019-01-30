import Data.List
import Data.Char
main = do 
    lines <- fmap reverse getLine
    putStrLn $ "You sayed " ++ lines 
    lines <- fmap  (intersperse '-' . reverse . map toUpper)  getLine
    putStrLn $ "You sayed: " ++ lines