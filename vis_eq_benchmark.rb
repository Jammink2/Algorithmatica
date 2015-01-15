# a benchmark for visualizing equality checks when comparing data in strings

a = "test".split(//)
b = "test".split(//)
e = true

number = (a.length > b.length) ? a.length : b.length

number.times do |index|
    if a[index] == b[index]
        puts "#{a[index]} is equal to #{b[index]}"
    else 
        puts "#{a[index]} is not equal to #{b[index]}"
        e = false
        break
    end
end

puts "#{a.join} equal to #{b.join}: #{e}"
        
