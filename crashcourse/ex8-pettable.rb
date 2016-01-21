module Pettable
	def pet
		puts "Awwww... #{self.name} likes it!"
	end
end


#Test

class Bunny
  include Pettable
  def name
"Fluffy"
end 
end
Bunny.new.pet # => "Awwww... Fluffy likes it!"