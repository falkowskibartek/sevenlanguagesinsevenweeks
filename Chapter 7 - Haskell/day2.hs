module Day2 where
    sort :: [Integer] -> [Integer]
    sort [] = []    
    sort (h:t) = put(sort t, h)

    put :: ([Integer], Integer) -> [Integer]
    put ([], item) = [item]  
    put ((h:t), item) 
        | h > item = item:h:t
        | otherwise = h:put(t, item)

--execution:
--sort([0], 2) -> put ([0], 2) -> [0,2]
--sort([0, 2], 4) -> put ([0, 2], 4) -> [0,2,4]
--etc.

    sortfun :: (Integer -> Integer -> Bool) -> [Integer] -> [Integer]
    sortfun f [] = []    
    sortfun f (h:t) = putfun f (sortfun f t) h

    putfun :: (Integer -> Integer -> Bool) -> [Integer] -> Integer -> [Integer]
    putfun f [] item = [item]  
    putfun f (h:t) item 
        | f h item = item:h:t
        | otherwise = h:putfun f t item

--usage:
--sortfun (\x y -> x > y) [3,2,1,5,7,2,3,9,77777]

    convertstring :: [Char] -> Double
    convertstring str =  read (filter (\x -> x /= '$' && x /= ',') str) :: Double

    everythirdnumber :: Integer -> [Integer]
    everythirdnumber x = x:(everythirdnumber (x + 3))

    everyfifthnumber :: Integer -> [Integer]
    everyfifthnumber y = y:(everyfifthnumber (y + 5))
    
    everyeighthnumber :: Int -> [Integer]
    everyeighthnumber t = take t (zipWith (+) (everyfifthnumber 0) (everythirdnumber 0))

--usage:
--everyeighthnumber 20

    dividenumbers :: Double -> Double -> Double
    dividenumbers x y = y / x