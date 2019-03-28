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
