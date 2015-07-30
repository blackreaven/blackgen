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

		def step(n)
			str = ''
			index = 0
			len = @charset.length
			while n!=-1
				str[index] = @charset[0 + ((n % len == 0) ? len : n % len) - 1]
				index+=1
				n = (n-1)/len
			end
			str = str.reverse!
			str[0] = ''
			return str
		end
	end
end