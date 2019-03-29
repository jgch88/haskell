module Problem1
( problem1
) where

multipleOfN :: (Eq a, Integral a) => a -> a -> Bool
multipleOfN x n = x `mod` n == 0

multipleOf :: (Eq a, Integral a) => a -> [a] -> String -> Bool 
multipleOf x [] logicOperator = False
multipleOf x (n:[]) logicOperator = multipleOfN x n
multipleOf x (n:ns) logicOperator = ((multipleOf x [n] logicOperator) `operateOnBooleans` (multipleOf x ns) logicOperator) logicOperator 

operateOnBooleans :: Bool -> Bool -> String -> Bool
operateOnBooleans bool1 bool2 logicOperator
  | logicOperator == "||" = bool1 || bool2
  | logicOperator == "&&" = bool1 && bool2
  | otherwise = error "bad logic operator, try || or &&"

operateOnResultList :: (Eq a, Integral a) => String -> [a] -> a 
operateOnResultList operator (n:ns)
  | operator == "sum" = sum (n:ns)
  | operator == "product" = product (n:ns)
  | otherwise = error "bad operator, try sum or product"

-- Blackbox function
-- usage: problem1 1 999 [3,5] "||" "sum"
problem1 :: (Eq a, Integral a) => a -> a -> [a] -> String -> String -> a
problem1 startRange endRange multipleList@(multiple:multiples) logicOperator mathOperator =
  mathOperator `operateOnResultList` ([ x | x <- [startRange..endRange], (x `multipleOf` multipleList) logicOperator])
