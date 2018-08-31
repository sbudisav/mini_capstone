require 'http'

#this retrieves the index action
system "clear"
puts "Welcome to Waynes hockey sticks here is what we have right now"

responce = HTTP.get("http://localhost:3000/api/products")
stick = responce.parse
stick.each do |sticks| 
  puts "Item #{sticks["id"]} #{sticks["name"]}"
end
puts "Which one do you want to know about:"
stick_num = gets.chomp

puts "This stick is the #{stick["name"]"