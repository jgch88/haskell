# Notes from learning Haskell
## learnyouahaskell.com

## Install (Ubuntu)
`sudo apt-get install haskell-platform`

This installs `ghci`, the interactive prompt.
`:q` to *quit* ghci (like vim).

## Setup
* create a .hs file (the Haskell script), e.g. myfunctions.hs
* open ghci
* `:l myfunctions.hs` to *load* the script and use the functions

## Chapter 2 - Starting Out
* `/=` is not equals
* `succ 8` is the *successor* of 8, i.e. 9.
* `doubleMe x = x*2` syntax for *defining a simple function*
*
```haskell
doubleSmallNumber x = if x > 100
                      then x
                      else x*2
``` 
*conditionals* must have *else*, because the if statement must return a value.
* `variable'with'aprostrophe'in'name = "isValid"`
* `"concatenate" ++ "lists" ++ "with" ++ "++"` a string is a list of characters. Warning: iterates through the 50 million items of the items on the list to the left of ++
* `5:[1,2,3,4]` the *:* (cons operator) operator adds item to front of the list. This operator is *instantaneous*!
* `Steve Buscemi !! 6` get item at *index*
* `[3,2,1] > [2,10,100]` the > operator on lists will start from heads of both lists. if they are not equal, a result is returned and the comparison down the list stops. if
they are equal, the second items are compared, and so on. In this case *True* is returned because the first element was enough (we never got to evaluate the second elements).
* `head`, `tail` are *first*, *the rest*
* `init`, `last` are *the rest*, *last*
* `null [1,2,3]` checks if list is empty
* `take`, `drop` takes/drops n items from the list. n can be larger than the list
* `4 \`elem\` [3,4,5,6]` returns True if item is an *element* of the list. Note the *infix* notation using backticks, rather than `elem 4 [3,4,5,6]`
