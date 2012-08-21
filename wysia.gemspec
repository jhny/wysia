# -*- encoding: utf-8 -*-
require File.expand_path('../lib/wysia/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Johnny Eradus"]
  gem.email         = ["jeradus@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""
  gem.files         = `git ls-files`.split($\)

  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  #gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "wysia"
  gem.require_paths = ["lib"]
  gem.version       = Wysia::VERSION

  gem.add_dependency "railties", ">= 3.1"
  gem.add_dependency "wysihtml5", ">= 0.3.0"
end
