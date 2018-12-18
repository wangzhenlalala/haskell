import Control.Monad
import Data.Char

main = forever $ do
    putStr "Give me some inputs: "
    l <- getLine
    putStrLn  $ map toUpper l