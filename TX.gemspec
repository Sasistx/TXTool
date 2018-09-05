
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "TX/version"

Gem::Specification.new do |spec|
  spec.name          = "TX"
  spec.version       = TX::VERSION
  spec.authors       = ["gaotianxiang"]
  spec.email         = ["genius_tx@sina.com"]

  spec.summary       = %q{A gem test demo}
  spec.description   = %q{A gem test demo for practise}
  spec.homepage      = "https://github.com/Sasistx"
  spec.license       = "MIT"

  # # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = "TX"#`git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }#"TX"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
