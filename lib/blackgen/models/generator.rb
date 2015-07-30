module Blackgen
	class Generator
		attr_accessor :charset
		attr_accessor :min
		attr_accessor :max
		
		def initialize(charset, min=1, max=8)
			@charset = charset
			@min = min 
			@max = max
		end

		def generate
			raise "Not implemented"
		end

		
	end
end