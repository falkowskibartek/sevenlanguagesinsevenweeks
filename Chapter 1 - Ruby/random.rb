$random = rand(10)

puts "Guess the number"
$number = gets.chomp

if $number > $random then puts "Too low" end