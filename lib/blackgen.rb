require "blackgen/version"
require "blackgen/models/full_generator"
require "blackgen/models/random_generator"
require "commander"

module Blackgen
  # Your code goes here...
  class BlackgenApplication
    include Commander::Methods

    def run
      program :name, 'Blackgen'
      program :version, Blackgen::VERSION
      program :description, 'Wordlist generator.'

      command :full do |c|
        c.syntax = 'blackgen full'
        c.description = 'Generate incremental word list'
        c.option '-m', '--min SIZE', Integer, 'Set min size'
        c.option '-M', '--max SIZE', Integer, 'Set max size'
        c.option '-c', '--charset CHARSET', String, 'Set max size'
        c.action do |args, options|
          options.default \
  				   :min => 1,
             :max => 8,
             :charset => [('a'..'z'), ('A'..'Z'), ('!'..'?')].map { |i| i.to_a }.flatten

          if options.charset.kind_of?(String)
            options.charset = options.charset.split('')
          end

          generator = FullGenerator.new(options.charset, options.min, options.max)

          generator.generate
        end
      end

      command :random do |c|
        c.syntax = 'blackgen random'
        c.description = 'Generate random word list'
        c.option '-m', '--min SIZE', Integer, 'Set min size'
        c.option '-M', '--max SIZE', Integer, 'Set max size'
        c.option '-c', '--charset CHARSET', String, 'Set max size'
        c.action do |args, options|
          options.default \
  				   :min => 1,
             :max => 8,
             :charset => [('a'..'z'), ('A'..'Z'), ('!'..'?')].map { |i| i.to_a }.flatten

          if options.charset.kind_of?(String)
            options.charset = options.charset.split('')
          end

          generator = RandomGenerator.new(options.charset, options.min, options.max)

          generator.generate
        end
      end
      run!
    end
  end

  def self.run()
    BlackgenApplication.new.run
  end
end
