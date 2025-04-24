module Prob1 where

import Control.Applicative

main :: IO ()
main = do
    print $ process 9 [2, 7, 11, 15]
    print $ process 6 [3, 2, 4]
    print $ process 6 [3, 3]

process :: Integer -> [Integer] -> Maybe (Integer, Integer)
process target nums = go zipped
  where
    zipped = zip nums [0 :: Integer ..]
    go ((n, n_i) : (m, m_i) : ns)
        | n + m == target = Just (n_i, m_i)
        | otherwise = go ((n, n_i) : ns) <|> go ((m, m_i) : ns)
    go _ = Nothing
