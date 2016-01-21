# file_contents = IO.read(ARGV[0])
# words = file_contents.scan /\w+/
# # puts words

# frequency =  Hash.new(0)
# words.each do |word|
# 	frequency[word] += 1
# end
# # puts frequency


## improved
frequency =  Hash.new(0)
IO.read(ARGV[0]).scan(/\w+/).each do |word|
	frequency[word] += 1
end

frequency.each do |k,v|
	puts "#{k}:\t#{v}"
end

# part b. sort
sorted = frequency.to_a.sort_by do |k,v|
	v
end

puts "Sorted:"
sorted.reverse.each do |k,v|
	puts "#{k}:\t#{v}"
end

## even more concise solution:
=begin
	
freqs.to_a.
      sort_by(&:last).
      reverse.
      each do |word, freq|
  puts "#{word}: #{freq}"
end
	
=end