class Animal
	def initialize name, sound
		# @name = name
		# @sound = sound
		@name, @sound = name, sound
	end

	def speak
		puts "#{@name} says #{@sound}"
	end
end

class Cow < Animal
	def initialize name
		super name, "mooooo"
	end
end

class Hacker < Animal
	def initialize name
		super name, "1010101"
	end
end

# Test
a = Animal.new("Ben Bitdiddle", "blah") 
a.speak # => "Ben Bitdiddle says blah" 
c = Cow.new("Bessie")
c.speak # => "Bessie saws moooooo"
h = Hacker.new("Alyssa P.")
h.speak # => "Alyssa P. says 10010101"