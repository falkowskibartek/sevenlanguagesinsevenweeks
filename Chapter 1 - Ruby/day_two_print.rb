arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
index = 1
arr.each do 
    |value| if index % 4 == 0 then puts "#{arr[index-4..index-1]}" end
index+=1
end

(1..16).each_slice(4) { |a| p a }