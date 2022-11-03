class Censor{
    val curseWordsByAlternatives = Map("Shoot" -> "Pucky", "Darn" -> "Beans")
    def Censore(text: String):String = {
        val r = curseWordsByAlternatives.foldLeft(text)((censored, tuple) => censored.replace(tuple._1, tuple._2))
        return r
    }
}

val c = new Censor
val res = c.Censore("asd as ads Shoot, Darn asdasd ")
printf("" + res)