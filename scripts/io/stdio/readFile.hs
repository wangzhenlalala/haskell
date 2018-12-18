import System.IO

-- openFile :: FilePath ­> IOMode ­> IO Handle .
main = do
    handle <- openFile "girlfriend.txt" ReadMode
    contents <- hGetContents handle
    putStr contents
    hClose handle

data BufferMode' = NoBuffering | LineBuffering | BlockBuffering (Maybe Int)