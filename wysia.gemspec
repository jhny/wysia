# -*- encoding: utf-8 -*-
require File.expand_path('../lib/wysia/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Johnny Eradus", "Benjamin Udink Ten Cate"]
  gem.email         = ["jeradus@gmail.com"]
  gem.description   = "wysihtml5 editor with font awesome"
  gem.summary       = "wysihtml5 editor with font awesome"
  gem.homepage      = "https://github.com/jhny/wysia"
  gem.files         = `git ls-files`.split($\)

  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  #gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "wysia"
  gem.require_paths = ["lib"]
  gem.version       = Wysia::VERSION

  gem.add_dependency "railties", ">= 3.1"
end
