{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Control.Applicative
import           Control.Monad.IO.Class
import           Data.ByteString
import           Data.ByteString.Lex.Fractional
import           Data.ByteString.Builder
import           Data.Map.Lazy as Map
import           Snap.Core
import           Snap.Util.FileServe
import           Snap.Http.Server

main :: IO ()
main = quickHttpServe site

site :: Snap ()
site =
    ifTop (writeBS "hello world") <|>
    route [ ("foo", writeBS "bar")
          , ("echo/:echoparam", echoHandler)
          , ("adder", adderHandler)
          ] <|>
    dir "static" (serveDirectory ".")

echoHandler :: Snap ()
echoHandler = do
    param <- getParam "echoparam"
    maybe (writeBS "must specify echo/param in URL")
          writeBS param

convertStringToFloat :: ByteString -> Maybe Float
convertStringToFloat input =
     case (readDecimal input)::Maybe (Float, ByteString) of
        Nothing -> Nothing
        Just (f,_) -> Just f

convertStringParametersToFloat :: [ByteString] -> Maybe Float
convertStringParametersToFloat list =
    case list of
        [] -> Nothing
        [value] -> convertStringToFloat value
        otherwise -> Nothing


adderHandler :: Snap()
adderHandler = do
    parameters <- getsRequest rqParams
    let result = do
            summand1StringList <- Map.lookup "summand1" parameters
            summand1 <- convertStringParametersToFloat summand1StringList
            summand2StringList <- Map.lookup "summand2" parameters
            summand2 <- convertStringParametersToFloat summand2StringList
            return (summand1 + summand2)
    case result of
        Nothing -> writeBS "Error - incorrect paramaters"
        Just f -> writeLBS $ toLazyByteString (floatDec f)