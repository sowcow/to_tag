# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'to_tag/version'

Gem::Specification.new do |spec|
  spec.name          = "to_tag"
  spec.version       = ToTag::VERSION
  spec.authors       = ["Alexander K"]
  spec.email         = ["xpyro@ya.ru"]
  spec.summary       = %q{ dsl for categorizing + web-ui for accessing any information }
  spec.description   = <<end
* structure pieces of information with tags using (ruby) dsl and markdown;
* build interactive static web page (ember) with convenient access to that information;
* use github to publish it and to collaborate in structuring;
end

  spec.homepage      = "https://github.com/sowcow/to_tag"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  .reject { |x|
    p x if x =~ %r=dist=
    return false if x =~ %r=^front-end/dist=
    x =~ %r=^front-end=
  }
            #&& x !~ /^front-end\/dist/ }

  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "aruba"
  spec.add_development_dependency "guard-cucumber"
  spec.add_development_dependency "guard-rspec"
end
