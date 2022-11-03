import scala.collection.mutable.HashMap

class Censor{
    val curseWordsByAlternatives = new HashMap[String, String]

    for(line <- io.Source.fromFile("curseWordsByAlternatives.txt").getLines){
        val splitted = line.split("-")
        curseWordsByAlternatives += splitted(0) -> splitted(1)
    }

    def Censore(text: String):String = {
        val r = curseWordsByAlternatives.foldLeft(text)((censored, tuple) => censored.replace(tuple._1, tuple._2))
        return r
    }
}

val c = new Censor
val res = c.Censore("asd as ads Shoot, Darn asdasd ")
printf("" + res)