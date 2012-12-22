# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'special_delivery/version'

Gem::Specification.new do |gem|
  gem.name          = "special_delivery"
  gem.version       = SpecialDelivery::VERSION
  gem.authors       = ["Adam Hutchison"]
  gem.email         = ["liveh2o@gmail.com"]
  gem.description   = %q{Use Bundler's rake tasks to release to your geminabox server.}
  gem.summary       = gem.description
  gem.homepage      = "http://github.com/liveh2o/special_delivery"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "bundler"
  gem.add_dependency "geminabox"
end
