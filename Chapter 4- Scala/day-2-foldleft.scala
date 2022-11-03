val list = List("Larry", "Bird", "Boston")

val totalLength = list.foldLeft(0)((sum, value) => sum + value.length)

printf("" + totalLength)