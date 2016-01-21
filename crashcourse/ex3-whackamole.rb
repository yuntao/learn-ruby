moles = Array.new(20) do |idx|
  rand(2) == 1 #? true : false
end
# puts moles

molesIndex = []
moles.each_with_index do |mole, i|
	if mole 
		molesIndex.push i
	end
end

puts "Enter 5 guesses, separated by comma:"
guesses = gets.strip.split(",")
correctGuesses = guesses.select{|x| moles[x.to_i]}

puts "You got #{correctGuesses.length} right."
puts "The moles were at #{molesIndex.join(", ")}."



