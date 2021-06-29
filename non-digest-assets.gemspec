# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = "non-digest-assets"
  s.version     = "1.1.0"
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

  s.required_ruby_version = ">= 2.5"

  s.add_dependency "activesupport", ">= 5.2", "< 6.2"
  s.add_dependency "sprockets", [">= 2.0", "< 5.0"]

  s.add_development_dependency "appraisal", "~> 2.3"
  s.add_development_dependency "aruba", "~> 1.0"
  s.add_development_dependency "pry", "~> 0.14.0"
  s.add_development_dependency "rails", [">= 5.0", "< 6.2"]
  s.add_development_dependency "rake", "~> 13.0"
  s.add_development_dependency "rspec", "~> 3.10"
  s.add_development_dependency "rubocop", "~> 1.18.0"
  s.add_development_dependency "rubocop-packaging", "~> 0.5.1"
  s.add_development_dependency "rubocop-performance", "~> 1.11.3"
  s.add_development_dependency "rubocop-rails", "~> 2.11.0"
  s.add_development_dependency "rubocop-rake", "~> 0.6.0"
  s.add_development_dependency "rubocop-rspec", "~> 2.4.0"
end
