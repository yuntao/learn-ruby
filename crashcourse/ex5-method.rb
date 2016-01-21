def frequencies file, &b
	#
	frequency =  Hash.new(0)
    IO.read(file).scan(/\w+/).each do |word|
    	frequency[word] += 1
    end

    # puts frequency

	frequency.to_a.
      sort_by(&:last).
      reverse.
      each &b # mindblown alternative

      # do |word, freq|
      # 	#puts "#{word}:\t#{freq}"
      # 	b.call [word,freq]
      # end
  
end



# Make your word frequency counter into a method that takes a file name and yields word, frequency pairs.

frequencies("ex1-stringinator.rb") do |word, freq|
  puts "#{word} occurred #{freq} times"
end
