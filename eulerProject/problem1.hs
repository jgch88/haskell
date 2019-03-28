-- variables and abstractions
multiples = [3 :: Integer, 5 :: Integer]
startRange = 1 :: Integer
endRange = 999 :: Integer
logicOperator = "||"
mathOperator = "sum"

-- since the user can define any list of multiples, e.g. [3,5] or [3,5,7]
-- multipleOf takes an Integer x and an Integer list [n1, n2...] and returns the Bool true if x is divisible by any n
multipleOf :: (Eq a, Integral a) => a -> [a] -> Bool --need Eq and Integral typeclasses to check that the inputs in this function can test for equality (Eq) and use modulus (Integral)
-- we have to recursively check through whether x is a multiple of each n within the multiples list
-- use pattern matching to extract a single n (the head, n) to evaluate, or recursively run multipleOf on rest of the list (the tail, ns)
multipleOf x [] = False
multipleOf x [n] = x `mod` n == 0
multipleOf x (n:ns) = multipleOf x [n] || multipleOf x ns
-- the xs in x:xs and ns in n:ns means x's and n's, like plural x and n

filteredMultipleList = [ x | x <- [startRange..endRange], multipleOf x multiples ]
sumOfFilteredMultipleList = sum filteredMultipleList
