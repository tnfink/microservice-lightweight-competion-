{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Control.Applicative
import           Control.Monad.IO.Class
import           Data.ByteString
import           Data.ByteString.Lex.Fractional
import           Data.ByteString.Builder
import           Data.Map.Lazy as Map
import           Snap.Core
import           Snap.Http.Server

main :: IO ()
main = quickHttpServe $
            route [  ("adder", adderHandler) ]

convertBStringToFloat :: ByteString -> Maybe Float
convertBStringToFloat input =
     case readDecimal input :: Maybe (Float, ByteString) of
        Nothing -> Nothing
        Just (f,_) -> Just f

convertUniqueParameterToFloat :: [ByteString] -> Maybe Float
convertUniqueParameterToFloat list =
    case list of
        [] -> Nothing
        [value] -> convertBStringToFloat value
        otherwise -> Nothing


adderHandler :: Snap()
adderHandler = do
    parameters <- getsRequest rqParams
    let result = do
            summand1StringList <- Map.lookup "summand1" parameters
            summand1 <- convertUniqueParameterToFloat summand1StringList
            summand2StringList <- Map.lookup "summand2" parameters
            summand2 <- convertUniqueParameterToFloat summand2StringList
            return (summand1 + summand2)
    case result of
        Nothing -> do
                    modifyResponse $ setResponseCode 400
                    writeBS "Error - incorrect parameters"
        Just f -> writeLBS $ toLazyByteString (floatDec f)