List dim := method(length, numberOfLists,
    result := List clone
    for (i, 1, numberOfLists,
        list := List clone  
        for (j, 1, length, list append(j))
        result append(list)
        )
    return result)

List set := method(x, y, value,
    list := self at(x)
    list atPut(y, value))

List get := method(x, y,
    list := self at(x)
    return (list at(y)))

l := List dim(3, 4)
l println
l set(1, 1, 100)
l set(0, 0, 200)
l println
l get(0, 0) println