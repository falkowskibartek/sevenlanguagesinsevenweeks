l := list(list(1,2), list(3,4))
result := 0
l foreach(i, v, 
    v foreach (i2, v2, 
     result = result + v2
     v2 println))

result println

