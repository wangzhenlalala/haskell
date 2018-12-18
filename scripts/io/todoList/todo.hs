import Data.List
import System.IO
import System.Directory

main = do
    handle <- openFile "todo.txt" ReadMode
    (tempName, tempHandle) <- openTempFile "." "temp"
    contents <- hGetContents handle
    let todoTasks = lines contents
        numberedTasks = zipWith (\index item -> show index ++ " - " ++ item) [0..] todoTasks
    putStrLn "here are all of your todos:"
    putStr $ unlines numberedTasks

    putStrLn "Which one do you want to delete?"

    indexString <- getLine
    let indexNumber = read indexString
        newTodoTasks =  delete (todoTasks !! indexNumber) todoTasks
    hPutStr tempHandle $ unlines newTodoTasks
    hClose handle
    hClose tempHandle
    removeFile "todo.txt"
    renameFile tempName "todo.txt"
    
