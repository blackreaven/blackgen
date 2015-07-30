require 'blackgen/models/generator'

module Blackgen
	class ThreadGenerator < Generator
		def initialize(charset, min=1, max=8)
			super(charset, min=1, max=8)
		end
	end
end