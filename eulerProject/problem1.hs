-- variables
multiples = [3 :: Integer, 5 :: Integer]
startRange = 1 :: Integer
endRange = 999 :: Integer
logicOperator = "||"
mathOperator = "sum"

-- do some kind of pattern matching here?
multipleOf :: (Eq a, Integral a) => a -> a -> Bool
multipleOf x n
  | x `mod` n == 0 = True
  | otherwise = False
-- how to create an abstracted function multipleOfN?

filteredMultipleList = [ x | x <- [startRange..endRange], n <- multiples, multipleOf x n ]
sumOfFilteredMultipleList = sum filteredMultipleList
