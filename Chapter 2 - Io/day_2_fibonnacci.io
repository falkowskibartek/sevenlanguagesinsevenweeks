fib := method(
    index,
    if (index == 1, return 1)
    if (index == 2, return 1)

    result := fib(index-2) + fib(index-1)
    return result
    )

fib(1) println
fib(1) println
fib(4) println
fib(5) println
fib(6) println