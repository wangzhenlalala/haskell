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

-- view filePaht
view :: [String] -> IO ()
view [filePath] = do
    handle <- openFile filePath ReadMode
    contents <- hGetContents handle
    let fileLines =  lines contents
        numberedLines = zipWith (\n line -> show n ++ " - " ++ line) [0..] fileLines 
    putStr $ unlines numberedLines

-- remove filePath index
remove :: [String] -> IO ()
remove [filePath,index] = do
    handle <- openFile filePath ReadMode
    (tempName, tempHandle) <- openTempFile "." "temp"
    contents <- hGetContents handle
    let numberIndex = read index 
        todoList = lines contents
        deletedList = delete (todoList !! numberIndex) todoList
    hPutStr tempHandle $ unlines deletedList
    hClose handle
    hClose tempHandle
    removeFile filePath
    renameFile tempName filePath 
        

    