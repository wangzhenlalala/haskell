import System.Environment
import System.IO
import System.IO.Error
import Control.Exception

main = toTry `catch` handler

toTry :: IO ()
toTry = do 
    (filename:_) <- getArgs
    contents <- readFile filename
    putStrLn $ "The file has " ++ show (length $ lines contents) ++ " lines."
        
handler :: IOError -> IO ()
-- handler e = putStrLn "whoops, something wrong happend"

-- handler e 
--     | isDoesNotExistError e = putStrLn "Sorry, the file doesn't exist!"
--     | otherwise = ioError e

handler e 
    | isDoesNotExistError e = case ioeGetFileName e of 
                                    Just path ->  putStrLn $ "Whoops! File does not exist at: " ++ path 
                                    Nothing  -> putStrLn "Whoops, File does not exist at unknown location"
    | otherwise = ioError e