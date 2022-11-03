import scala.io._
import scala.actors._
import Actor._
import scala.util.matching.Regex

object PageLoader {
    def getPageSize(url: String) = Source.fromURL(url).mkString.length
    def getNumberOfLinks(url: String) = {
        ("<a".r.findAllIn(Source.fromURL(url).mkString)).length
    }
    def getLinks(url: String) = {
        var links = Set("")
        val hrefs = "href=['\"](?<url>.*?)['\"]".r.findAllIn(Source.fromURL(url).mkString)
        for (href <- hrefs) {
            val link = href.replace("href=", "").replace("\"", "")
            //println(link)
            links = links + link
        }

        links
    }
}

var urls = List("http://www.amazon.com/","http://www.twitter.com/","http://www.google.com/","http://www.cnn.com")

def timeMethod(method: ()=>Unit) = {
    val start = System.nanoTime
    method()
    val end = System.nanoTime
    println("Method took " + (end-start)/1000000000.0 + " seconds.")
}

def getPageSizeSequentially() = {
    for(url <- urls) {
        println("Size for " + url + ": " + PageLoader.getPageSize(url))
    }
}

def getPageSizeConcurrently() = {
    var caller = self

    for (url <- urls) {
        actor { caller ! (url, PageLoader.getPageSize(url)) }
    }

    for (i <- 1 to urls.size) {
        receive {
            case (url, size) => println("Size for " + url + ": " + size)
        }
    }
}

def getNumberOfLinksConcurrently() = {
    var caller = self

    for (url <- urls) {
        actor { caller ! (url, PageLoader.getNumberOfLinks(url)) }
    }

    for (i <- 1 to urls.size) {
        receive {
            case (url, number) => println("Number of links for " + url + ": " + number)
        }
    }
}

def getSizeOfPageAndLinksConcurrently() = {
    var caller = self

    for (url <- urls) {
        actor { caller ! (url, PageLoader.getLinks(url)) }
    }

    for (i <- 1 to urls.size) {
        receive {
            case (url, links) => {
                println(links)
                for (link <- List(links)) {
                    println("Links for " + url + ": " + link)
                }
            } 
        }
    }
}

// println("Sequential run:")
// timeMethod { getPageSizeSequentially}

// println("Concurrent run:")
// timeMethod { getPageSizeConcurrently }

println("Concurrent run for get number of links:")
timeMethod { getNumberOfLinksConcurrently }

timeMethod { getSizeOfPageAndLinksConcurrently }