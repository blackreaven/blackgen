module Blackgen
  class RandomGenerator < Generator

    def generate()
      first = ((1-@charset.length**(@min))/(1-@charset.length))
      last = ((1-@charset.length**(@max+1))/(1-@charset.length))-1

      r = Random.new
      for i in first..last
        puts self.step(r.rand(first..last))
      end
    end
  end
end