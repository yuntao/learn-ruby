class Person
	attr_accessor :friends
	@@people = {}#Hash.new(0)

	def initialize name, *friends
		#
		@name = name
		@friends = friends
		@@people[name] = self
	end

	# def friends
	# 	@friends
	# end

	def self.find name
		@@people[name]
	end

	def distance_to person, &b
		found = @friends.select do |friend|
			friend == person
		end

		if @friends.length == 0
			#puts "no friends"
			[]
		elsif found.length > 0
			found.push self
			#puts "found #{found.join(" -> ")}"
			b.call found
		else
			friends_distance_to person
		end
		end

	end

	def friends_distance_to person
		#
		@friends.each do |friend|
		friend.distance_to person do |found|
			#
				if found.length == 0
			[]
		else
			found.push self
			puts "found #{found.join(" -> ")}"
		end
		end
	end
end



#test

g = Person.new "George"
a = Person.new "Arthur", g 
f = Person.new "Fred", a, g 
puts "1 #{f.friends}"  # => [a, g] 
puts "2 #{a.friends}"  # => [g] 
puts "Find Arthur"
puts Person.find "Arthur" # => a

puts "Bonus:"
a = Person.new "A"
b = Person.new "B", a
c = Person.new "C"
d = Person.new "D", b, c 
puts "a #{a}"
puts "b #{b}"
puts "c #{c}"
puts "d #{d}"
d.distance_to a # => 2
# D -> B -> A = 2 
a.distance_to b # => nil
