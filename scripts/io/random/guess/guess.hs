import Control.Monad(when)
import System.Random 
import System.IO

main = do
    gen <- getStdGen
    askForNumber gen 

askForNumber :: StdGen -> IO ()
askForNumber gen = do
    let (randomNumber, newGen) =  randomR (1,10) gen :: (Int, StdGen)
    putStr "Guess a Number Between 1 to 10: "
    hFlush stdout -- we have to add this
    hSetBuffering stdin NoBuffering  -- not work
    numberString <-  getLine
    when (not $ null numberString) $ do
        let number = read numberString
        if randomNumber == number
            then putStrLn "You are rignt"
            else putStrLn $ "Sorry wrong. it is: " ++ show randomNumber
        askForNumber newGen
