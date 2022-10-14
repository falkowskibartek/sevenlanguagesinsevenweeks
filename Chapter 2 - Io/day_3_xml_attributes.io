curlyBrackets := method(
    args := call message arguments
    arg := args at(0)
    splittedArg := "#{arg}" interpolate split(":")
    key := splittedArg at(0) exSlice(1,splittedArg at(0) size - 2)
    value := splittedArg at(1)
    r := " #{key} = #{value}" interpolate
    r
)

Builder := Object clone
Builder forward := method(
    name := call message name
    //writeln(name)
    args := call message arguments
    //writeln(args)
    indentation := false
    attributeContent := ""
    if (call sender type == "Builder", 
        indentation := true
        attributeContent := self doMessage(call message argAt(0))
        )
    //if (indentation == true, write("  "))
    
    attribute := ""
    if (attributeContent type == "Sequence", attribute := attributeContent)
    //writeln(attribute)
    writeln("<", call message name, attribute, ">")

    args foreach(
        arg,
        content := self doMessage(arg)
        //if(content type == "Sequence" and indentation == true, write("    "))
        if(content type == "Sequence", writeln(content)))
    if (indentation == true, write("  "))


    // writeln("<", call message name, attribute, ">")
    // arg := call message arguments at(1)
    // content := self doMessage(arg)
    // if(content type == "Sequence" and indentation == true, write("    "))
    // if(content type == "Sequence", writeln(content))
    // if (indentation == true, write("  "))
    writeln("</", call message name, ">")
    )

Builder library(
    book({"author":"Fiodor Dostoyevski"}, "Crime and Punishment"),
    book({"author":"Ernest Hemingway"}, "Old Man and the Sea"),
    book({"author":"Franz Kafka"}, "Trial"))

