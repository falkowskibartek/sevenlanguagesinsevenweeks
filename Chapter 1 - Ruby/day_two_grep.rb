file = File.open("grep.txt")

file_data = file.readlines(&:chomp)

puts "File is loaded, which phrase do you want to search?"
filter = gets

file_data.each_with_index do |element, index|
    if element =~ /#{filter.chomp}/ then puts "Found #{filter} in line #{element} at index #{index}" end
end

file.close