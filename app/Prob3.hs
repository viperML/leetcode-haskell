module Prob3 where

main :: IO ()
main = do
  print $ solve "abcabcbb"
  print $ solve "bbbbb"
  print $ solve "pwwkew"

solve :: String -> Int
solve input = maximum lengths
  where
    go :: String -> String -> String
    go (c : rest) result
      | c `elem` result = result
      | otherwise = go rest (c : result)
    go "" result = result

    subres :: String -> [String]
    subres (c : rest) = go (c:rest) "" : subres rest
    subres "" = []

    strings = subres input
    lengths = length <$> strings


