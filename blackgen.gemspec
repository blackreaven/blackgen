# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blackgen/version'

Gem::Specification.new do |spec|
  spec.name          = "blackgen"
  spec.version       = Blackgen::VERSION
  spec.authors       = ["tperrin"]
  spec.email         = ["tperrin@clever-age.com"]

  spec.summary       = %q{Blackgen is a wordlist generator.}
  spec.description   = %q{Blackgen is a wordlist generator with 2 mode : full or random.}
  spec.homepage      = "https://github.com/blackreaven/blackgen"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = ""
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "commander", "~> 4.3"
end
