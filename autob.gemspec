# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'autob/version'

Gem::Specification.new do |spec|
  spec.name          = "autob"
  spec.version       = Autob::VERSION
  spec.authors       = ["Edson Lima"]
  spec.email         = ["edsonalima@gmail.com"]

  spec.summary       = 'An (useless) attempt to auto install missing gems in production, using Jruby'
  spec.description   = 'This (useless) tries to install missing gems calling Bundler inside a .jar'
  spec.homepage      = "http://leosoft.com.br"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://192.168.1.109:9292"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "bundler", "~> 1.14"
  spec.add_runtime_dependency "childprocess"

  spec.add_development_dependency 'warbler'
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
