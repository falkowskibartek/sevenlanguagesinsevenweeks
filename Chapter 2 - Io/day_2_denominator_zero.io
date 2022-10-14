origin := Number getSlot("/")
Number / := method(n, 
    if (n == 0, return 0)
    return origin(n))

(6/0) println
(6/2) println