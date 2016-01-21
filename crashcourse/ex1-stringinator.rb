puts "Welcome to The Stringinator.  Enter a string:"
string = gets
puts "Enter a command:"
command = gets.downcase.strip

if command == "upcase"
	output = string.upcase
else
	output = string
end

puts "Your new string is: #{output}"