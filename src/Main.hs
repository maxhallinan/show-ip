module Main where

import qualified Network.Socket as Socket
import qualified System.Environment as Env

main :: IO ()
main = do
  (hostName : _) <- Env.getArgs
  (addrInfo : _) <- Socket.getAddrInfo Nothing (Just hostName) Nothing
  let address = Socket.addrAddress addrInfo
  putStrLn $ show address
