l := list(1, 3, 5, 7, 8)

l myAverage := method(
    sum := 0
    size := (self size);

    if (size == 0, Exception raise("empty list"))

    self foreach (i, v, 
    sum := sum + v)
    
    result := sum / size
    result
)

l myAverage println