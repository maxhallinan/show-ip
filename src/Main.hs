module Main where

import Data.Foldable (fold)
import qualified Network.Socket as Socket
import qualified System.Environment as Env

main :: IO ()
main = do
  (hostName : _) <- Env.getArgs
  addrInfos <- Socket.getAddrInfo Nothing (Just hostName) Nothing
  let addresses = (show . Socket.addrAddress) <$> addrInfos
  fold <$> traverse putStrLn addresses
