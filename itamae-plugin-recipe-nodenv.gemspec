
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "itamae/plugin/recipe/nodenv/version"

Gem::Specification.new do |spec|
  spec.name          = "itamae-plugin-recipe-nodenv"
  spec.version       = Itamae::Plugin::Recipe::Nodenv::VERSION
  spec.authors       = ["Masayoshi Wada"]
  spec.email         = ["developer@andantesoftware.com"]

  spec.summary       = %q{Itamae plugin to install node with nodenv}
  spec.description   = %q{Itamae plugin to install node with nodenv}
  spec.homepage      = "https://github.com/masawada/itamae-plugin-recipe-nodenv"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
