import System.Directory
import System.Environment
import System.IO
import Data.List

-- run:  ./arg first second third

-- main1 = do
--     args <- getArgs
--     progName <- getProgName
--     putStrLn "arguments are: "
--     mapM putStrLn args
--     putStrLn "program's name is: "
--     putStrLn progName

dispatch :: [ (String, [String] -> IO () ) ]
dispatch = [ ("add", add)
            ,("view", view)
            ,("remove", remove)
            ]




main = do
    -- [command:args] <- getArgs
    (command:args) <- getArgs
    let (Just action) = lookup command dispatch
    action args



-- add filePath itemContent
add :: [String] -> IO ()
add [filePath,todo] = appendFile filePath (todo ++ "\n")

view :: [String] -> IO ()
view [filePath] = do
    handle <- openFile filePath ReadMode
    contents <- hGetContents handle
    let fileLines =  lines contents
        numberedLines = zipWith (\n line -> show n ++ " - " ++ line) [0..] fileLines 
    putStr $ unlines numberedLines

remove :: [String] -> IO ()
remove [filePath,index] = do
    