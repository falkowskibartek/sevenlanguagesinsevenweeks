//matrix := list(list(1,2), list(3,4))
// I'm too lazy to convert this matrix to string (Sequence). Unless there is a smart way to do it?
matrix := "1 2 3
4 5 6
7 8 9"
f := File with("matrix.txt")
f remove
f openForUpdating
f write(matrix)
f close

f openForReading
readMatrix := f readToEnd
f close
readMatrix println