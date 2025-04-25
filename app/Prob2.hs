module Prob2 where

main :: IO ()
main = do
    print $ solve ([2, 4, 3], [5, 6, 4])
    print $ solve ([0], [0])
    print $ solve ([9, 9, 9, 9, 9, 9, 9], [9, 9, 9, 9])

solve :: ([Integer], [Integer]) -> [Integer]
solve (xs, ys) = go 0 zipped
  where
    zipped
        | length xs >= length ys = zip xs (ys ++ repeat 0)
        | otherwise = zip ys (xs ++ repeat 0)

    go :: Integer -> [(Integer, Integer)] -> [Integer]
    go carry ((x, y) : ns)
        | s >= 10 = (s - 10) : go 1 ns
        | otherwise = s : go 0 ns
      where
        s = x + y + carry
    go 1 [] = [1]
    go _ [] = []
