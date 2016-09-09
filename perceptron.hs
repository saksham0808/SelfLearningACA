import qualified Data.Eigen.Matrix as M
import qualified Foreign.C.Types as F
import           System.IO

-- Read space seperated words on a line from stdin
readInts :: String -> [Double]
readInts givenLine = map read $ words givenLine

regSolution :: [String] -> M.Matrix Double F.CDouble
regSolution inLines =
  let d2list = map readInts inLines
      xmat = [ [1,a,b] | [a,b,_] <- d2list]
      ymat = [ [x-4] | [_,_,x] <- d2list]
      matx = M.fromList xmat
      maty = M.fromList ymat
  in
      M.inverse ( M.transpose matx `M.mul` matx) `M.mul` M.transpose matx `M.mul` maty

main:: IO()
main = do
  putStrLn "Which file to open? (enter index): "
  index <- getLine
  fid <- openFile ("DataLin/" ++ index ++ ".txt") ReadMode
  inData <- hGetContents fid
  let theSolutionOfRegression = regSolution $ lines inData
  print theSolutionOfRegression
  hClose fid
