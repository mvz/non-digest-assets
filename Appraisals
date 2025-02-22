# frozen_string_literal: true

# HACK: This uses odd syntax to make appraisal customization work on newer Rubies.
# See https://github.com/thoughtbot/appraisal/pull/214. Once that one has been
# released, we should use customize_gemfiles instead.
Customize.new heading: <<~HEADING.chomp
  frozen_string_literal: true

  This file was generated by Appraisal
HEADING

appraise "rails_6_0" do
  gem "concurrent-ruby", "1.3.4"
  gem "rails", "~> 6.0.0"
  gem "sprockets", "~> 4.0"
end

appraise "rails_6_1" do
  gem "concurrent-ruby", "1.3.4"
  gem "rails", "~> 6.1.0"
  gem "sprockets", "~> 4.0"
end

appraise "rails_7_0" do
  gem "concurrent-ruby", "1.3.4"
  gem "rails", "~> 7.0.0"
  gem "sprockets", "~> 4.0"
  gem "sprockets-rails", "~> 3.0"
end

appraise "rails_7_1" do
  gem "rails", "~> 7.1.0"
  gem "sprockets", "~> 4.0"
  gem "sprockets-rails", "~> 3.0"
end

appraise "rails_7_2" do
  gem "rails", "~> 7.2.0"
  gem "sprockets", "~> 4.0"
  gem "sprockets-rails", "~> 3.0"
end

appraise "rails_8_0" do
  gem "rails", "~> 8.0.0"
  gem "sprockets", "~> 4.0"
  gem "sprockets-rails", "~> 3.0"
end
