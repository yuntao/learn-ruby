module Roman
	def self.from_roman str
		#
	end

	def self.to_roman int 
		#
	end

end

class String
	def from_roman
		Roman.from_roman(self)
	end
end

class Integer
	def to_roman
		Roman.to_roman(self)
	end
end
