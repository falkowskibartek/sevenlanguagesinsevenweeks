Builder := Object clone
Builder forward := method(
    indentation := false
    if (call sender type == "Builder", indentation := true)
    if (indentation == true, write("  "))
    writeln("<", call message name, ">")
    call message arguments foreach(
        arg,
        content := self doMessage(arg)
        if(content type == "Sequence" and indentation == true, write("    "))
        if(content type == "Sequence", writeln(content)))
    if (indentation == true, write("  "))
    writeln("</", call message name, ">"))
Builder ul(
    li("Io"),
    li("Lua"),
    li("JavaScript"))

