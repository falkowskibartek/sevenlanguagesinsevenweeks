object Game {
    var coordinates : List[(String, String)] = List(
        ("a1", "-"),("a2", "-"),("a3", "-"),
        ("b1", "-"),("b2", "-"),("b3", "-"),
        ("c1", "-"),("c2", "-"),("c3", "-")
    );
    var wins = List(
        List("a1","a2","a3"),List("b1","b2","b3"),List("c1","c2","c3"),
        List("a1","b1","c1"),List("a2","b2","c2"),List("a3","b3","c3"),
        List("a1","b2","c3"),List("a3","b2","c1"))
    
    def set(pick: String) {
        coordinates = coordinates.map { c => if (c._1 == pick) (c._1, "X") else c };
        print()
    }

    def print() {
        printf(coordinates(0)._2)
        printf(coordinates(1)._2)
        printf(coordinates(2)._2)
        println()
        printf(coordinates(3)._2)
        printf(coordinates(4)._2)
        printf(coordinates(5)._2)
        println()
        printf(coordinates(6)._2)
        printf(coordinates(7)._2)
        printf(coordinates(8)._2)
        println()
        println("Pick a place!")
    }

    def isOver():Boolean = {
        val r = wins.exists(win => win.forall(w => coordinates.find(c => c._1 == w).get._2 == "X"))
        if (r == true) printf("X won !!!")
        return r
    }
}

while (Game.isOver() == false) {
    Game.print()
    val input = scala.io.StdIn.readLine()
    Game.set(input)
}