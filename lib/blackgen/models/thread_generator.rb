require 'blackgen/models/generator'
require 'thread'

module Blackgen
  class ThreadGenerator < Generator
    attr_accessor :thread

    def initialize(charset, min=1, max=8, thread=4)
      super(charset, min, max)
      @thread = thread
    end

    def generate()
      first = ((1-@charset.length**(@min))/(1-@charset.length))
      last = ((1-@charset.length**(@max+1))/(1-@charset.length))-1
      #work_q = Queue.new
      #(first..last).to_a.each { |x| work_q.push x }
      r = Random.new

      Thread.abort_on_exception = true
      workers = (0...@thread).map do |i|
        Thread.new(i) do |i|
          begin
            while true
              puts self.step(r.rand(first..last))
            end
          rescue ThreadError
            raise "Thread error"
          end
        end
      end
      workers.map(&:join)
    end
  end
end