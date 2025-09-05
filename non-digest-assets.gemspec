# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "non-digest-assets"
  spec.version = "2.5.0"
  spec.platform = Gem::Platform::RUBY
  spec.authors = ["Alex Speller", "Matijs van Zuijlen"]
  spec.email = ["matijs@matijs.net"]
  spec.homepage = "http://github.com/mvz/non-digest-assets"
  spec.summary =
    "Make the Rails asset pipeline generate non-digest along with digest assets"
  spec.description = <<-DESCRIPTION
    Rails provides no option to generate both digest and non-digest
    assets. Installing this gem automatically creates both digest and
    non-digest assets which are useful for many reasons.

    Currently supports sprockets only.
  DESCRIPTION
  spec.files = %w[lib/non-digest-assets.rb LICENSE README.md]
  spec.license = "MIT"
  spec.require_path = "lib"

  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["rubygems_mfa_required"] = "true"

  spec.add_dependency "activesupport", ">= 6.0", "< 8.1"
  spec.add_dependency "mutex_m", "~> 0.3.0"
  spec.add_dependency "sprockets", "~> 4.0"

  spec.add_development_dependency "appraisal", "~> 2.3"
  spec.add_development_dependency "aruba", "~> 2.0"
  spec.add_development_dependency "rails", ">= 6.0", "< 8.1"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.10"
  spec.add_development_dependency "rubocop", "~> 1.80"
  spec.add_development_dependency "rubocop-packaging", "~> 0.6.0"
  spec.add_development_dependency "rubocop-performance", "~> 1.25"
  spec.add_development_dependency "rubocop-rails", "~> 2.33"
  spec.add_development_dependency "rubocop-rake", "~> 0.7.1"
  spec.add_development_dependency "rubocop-rspec", "~> 3.7"
  spec.add_development_dependency "sprockets-rails", "~> 3.0"
end
