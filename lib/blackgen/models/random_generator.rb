module Blackgen
  class RandomGenerator < Generator
    attr_accessor :step

    def initialize(charset, min=1, max=8)
      super(charset, min=1, max=8)
      @step = 0
    end

    def generate()
      first = ((1-@charset.length**(@min))/(1-@charset.length))
      last = ((1-@charset.length**(@max+1))/(1-@charset.length))-1

      r = Random.new
      for i in first..last
        puts self.step(r.rand(first..last))
      end
    end

    def next()
      @step += 1
      self.step(@step)
    end

    def prev()
      @step -= 1
      self.step(@step)
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