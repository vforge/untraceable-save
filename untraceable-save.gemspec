$:.push File.expand_path("../lib", __FILE__)
require "untraceable-save/version"

Gem::Specification.new do |gem|
  gem.name = "untraceable-save"
  gem.version = UntraceableSave::VERSION
  gem.summary = "ActiveRecord untraceable save."
  gem.description = "ActiveRecord untraceable save."
  gem.license = "MIT"

  gem.files = Dir["README.md", "MIT-LICENSE", "lib/**/*.rb"]

  gem.add_runtime_dependency 'activerecord', '>= 3.1'
  gem.add_runtime_dependency 'activesupport', '>= 3.1'

  gem.author = "Bartosz \"V.\" Bentkowski"
  gem.email  = "bartosz.bentkowski@gmail.com"
  gem.homepage = "https://github.com/vforge/untraceable-save"
end
