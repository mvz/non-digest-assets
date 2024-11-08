# frozen_string_literal: true

require "spec_helper"
require "rails"
require "sprockets"

RAILS_6_SPROCKETS_4_DIGEST =
  "b324c44f04a0d0da658824105489a2676d49df561c3d06723770321fd441977c"
RAILS_7_SPROCKETS_4_DIGEST =
  "e0cf9d8fcb18bf7f909d8d91a5e78499f82ac29523d475bf3a9ab265d5e2b451"
RAILS_8_SPROCKETS_4_DIGEST =
  "62814923c418882209e8243eee534d666011fe69fc61029bbdfd7d8c615949c3"

RSpec.describe "compiling assets using non-digest-assets", type: :aruba do
  let(:digest_key) do
    case Rails::VERSION::MAJOR
    when 6
      RAILS_6_SPROCKETS_4_DIGEST
    when 7
      RAILS_7_SPROCKETS_4_DIGEST
    else
      RAILS_8_SPROCKETS_4_DIGEST
    end
  end

  let(:rails_new_flags) do
    # NOTE: Many of these flags can be replaced by just --minimal once support
    # for Rails 6.0 is dropped.
    flags =
      "--skip-bundle --skip-spring --skip-bootsnap --skip-listen" \
      " --skip-test --skip-test-unit" \
      " --skip-javascript --skip-webpack-install"
    flags += " --skip-dev-gems" if Rails.version.to_f >= 7.0
    flags += " --skip-rubocop --skip-brakeman" if Rails.version.to_f >= 7.2
    flags += " --skip-kamal --skip-solid" if Rails.version.to_f >= 8.0
    flags
  end

  it "creates assets, both with and without digest" do
    run_command_and_stop "bundle exec rails new test_app #{rails_new_flags}"
    cd "test_app"
    append_to_file "Gemfile", "\ngem \"non-digest-assets\"\n"
    run_command_and_stop "bundle install"

    if Rails.version.to_f >= 8.0
      write_file "app/assets/config/manifest.js", <<~MANIFEST
        //= link_tree ../images
        //= link_directory ../stylesheets .css
      MANIFEST
    end

    expect("public/assets/").not_to be_an_existing_file
    run_command_and_stop "bundle exec rake assets:precompile"

    expect("public/assets/application-#{digest_key}.css").to be_an_existing_file
    expect("public/assets/application.css").to be_an_existing_file
    expect("public/assets/application-#{digest_key}.css.gz").to be_an_existing_file
    expect("public/assets/application.css.gz").to be_an_existing_file
  end
end
