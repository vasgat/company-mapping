# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'company/mapping/version'

Gem::Specification.new do |spec|
  spec.name          = "company-mapping"
  spec.version       = Company::Mapping::VERSION
  spec.authors       = ["vasgat"]
  spec.email         = ["vasgat@gmail.com"]

  spec.summary       = %q{Maps new companies with those in a given corpus.}
  spec.description   = %q{Given a Corpus of WikiRate Company Names and a new (incoming) Company Name, CompanyMapper class, finds the closest match if exists based on the calculated tf-idf similarity and a defined threshold.}
  spec.homepage      = %q{https://github.com/vasgat/company-mapping}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.5"
end
