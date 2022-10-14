Car := Object clone
Car drive := method("Wruum" println)
Car slotNames println

ferrari := Car clone
ferrari println

fiat := Car clone
fiat println

fiat clone := fiat
anotherFiat := fiat clone
anotherFiat println
anotherFiat drive