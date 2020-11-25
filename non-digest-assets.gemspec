# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = "non-digest-assets"
  s.version     = "1.0.10"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Alex Speller", "Matijs van Zuijlen"]
  s.email       = ["matijs@matijs.net"]
  s.homepage    = "http://github.com/mvz/non-digest-assets"
  s.summary     =
    "Make the Rails asset pipeline generate non-digest along with digest assets"
  s.description = <<-DESCRIPTION
    Rails provides no option to generate both digest and non-digest
    assets. Installing this gem automatically creates both digest and
    non-digest assets which are useful for many reasons.
  DESCRIPTION
  s.files         = %w(lib/non-digest-assets.rb LICENSE README.md)
  s.license       = "MIT"
  s.require_path  = "lib"

  s.required_ruby_version = ">= 2.4"

  s.add_dependency "activesupport", [">= 4.0", "< 6.1"]
  s.add_dependency "sprockets", [">= 2.0", "< 5.0"]

  s.add_development_dependency "appraisal", "~> 2.3"
  s.add_development_dependency "aruba", "~> 1.0"
  s.add_development_dependency "pry", "~> 0.13.1"
  s.add_development_dependency "rails", [">= 5.0", "< 6.1"]
  s.add_development_dependency "rake", "~> 13.0"
  s.add_development_dependency "rspec", "~> 3.10"
  s.add_development_dependency "rubocop", "~> 1.4.1"
  s.add_development_dependency "rubocop-performance", "~> 1.9.0"
end
