require "blackgen/models/generator"

module Blackgen
  class FullGenerator < Generator
    def generate()
      first = ((1-@charset.length**(@min))/(1-@charset.length))
      last = ((1-@charset.length**(@max+1))/(1-@charset.length))-1
      for i in first..last
        puts self.step(i)
      end
    end

  end
end