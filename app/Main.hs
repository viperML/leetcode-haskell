{-# LANGUAGE OverloadedRecordDot #-}

module Main where

import Options.Applicative
import qualified Prob1
import qualified Prob2

data Cli = Cli
    {problem :: Integer}
    deriving (Show)

cli :: Parser Cli
cli = Cli <$> option auto (long "problem" <> short 'd')

main :: IO ()
main = do
    parsedCli <- execParser $ info (cli <**> helper) fullDesc
    print parsedCli

    case parsedCli.problem of
        1 -> Prob1.main
        2 -> Prob2.main
        _ -> error "Problem not implemented"
