# frozen_string_literal: true

require "spec_helper"
require "rails"
require "sprockets"

RAILS_6_SPROCKETS_4_DIGEST =
  "b324c44f04a0d0da658824105489a2676d49df561c3d06723770321fd441977c"
RAILS_7_SPROCKETS_4_DIGEST =
  "e0cf9d8fcb18bf7f909d8d91a5e78499f82ac29523d475bf3a9ab265d5e2b451"

RSpec.describe "compiling assets using non-digest-assets", type: :aruba do
  let(:digest_key) do
    case Rails::VERSION::MAJOR
    when 6
      RAILS_6_SPROCKETS_4_DIGEST
    else
      RAILS_7_SPROCKETS_4_DIGEST
    end
  end

  let(:rails_new_flags) do
    flags =
      "--skip-bundle --skip-test-unit --skip-spring --skip-bootsnap --skip-listen" \
      " --skip-javascript"
    flags += " --skip-webpack-install"
    flags += " --no-skip-javascript" if Rails.version.to_f >= 6.1
    flags
  end

  it "creates assets, both with and without digest" do
    run_command_and_stop "bundle exec rails new test_app #{rails_new_flags}"
    cd "test_app"
    append_to_file "Gemfile", "\ngem \"non-digest-assets\"\n"
    run_command_and_stop "bundle install"
    # run_command_and_stop (bundle exec rake assets:clobber)
    expect("public/assets/").not_to be_an_existing_file
    run_command_and_stop "bundle exec rake assets:precompile"
    expect("public/assets/application-#{digest_key}.css").to be_an_existing_file
    expect("public/assets/application.css").to be_an_existing_file
    expect("public/assets/application-#{digest_key}.css.gz").to be_an_existing_file
    expect("public/assets/application.css.gz").to be_an_existing_file
  end
end
