answer = rand(10)

puts "Make a guess:"

while (guess = gets.strip.to_i) != answer
	if guess > answer
		puts "Too high"
	elsif guess < answer
		puts "Too low"
	end
end

puts "Correct!"


