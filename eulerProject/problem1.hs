-- variables and abstractions
multiples = [3 :: Integer, 5 :: Integer]
startRange = 1 :: Integer
endRange = 999 :: Integer
logicOperator = "||" -- or "&&"
mathOperator = "sum" -- or "product"


multipleOfN :: (Eq a, Integral a) => a -> a -> Bool
multipleOfN x n = x `mod` n == 0

-- since the user can define any list of multiples, e.g. [3,5] or [3,5,7]
-- multipleOf takes an Integer x and an Integer list [n1, n2...] and returns the Bool true if x is divisible by any n
-- e.g. 5 `multipleOf` [3, 5] == True
multipleOf :: (Eq a, Integral a) => a -> [a] -> Bool --need Eq and Integral typeclasses to check that the inputs in this function can test for equality (Eq) and use modulus (Integral)
-- we have to recursively check through whether x is a multiple of each n within the multiples list
-- use pattern matching to extract a single n (the head, n) to evaluate, or recursively run multipleOf on rest of the list (the tail, ns)
multipleOf x [] = False
-- (n:[]) is the same as [n], it means a list with ONE element
multipleOf x (n:[]) = multipleOfN x n
-- notice that instead of doing [n:ns] we need to do (n:ns) instead, to split it into head/tail for recursion
-- (n:ns) gives n and [ns], so we need to wrap n in [n], but we don't need to wrap ns as it is already [ns]
-- beware of list/non-list types causing compiler to crash
multipleOf x (n:ns) = multipleOf x [n] || multipleOf x ns
-- the xs in x:xs and ns in n:ns means x's and n's, like plural x and n

-- make a list of [1..99], then pipe each number from the list into x
-- run x through x `multipleOf` multiples predicate, if it passes 
-- it is added to the result list
resultList = [ x | x <- [startRange..endRange], x `multipleOf` multiples ]
-- sum the result list
sumOfFilteredMultipleList = mathOperator `operateOnResultList` resultList


operateOnResultList :: (Eq a, Integral a) => String -> [a] -> a 
-- made a mistake where I did String -> [a] -> Integer and compiler was complaining "Couldn't match expected type `a` with actual type `Integer`
operateOnResultList operator (n:ns)
  | operator == "sum" = sum (n:ns)
  | operator == "product" = product (n:ns)
  | otherwise = error "bad operator, try sum or product"

-- TODO: implement "||" into logic
