# frozen_string_literal: true

require "spec_helper"
require "rails"
require "sprockets"

SPROCKETS_3_DIGEST = "f0d704deea029cf000697e2c0181ec173a1b474645466ed843eb5ee7bb215794"
SPROCKETS_4_DIGEST = "b324c44f04a0d0da658824105489a2676d49df561c3d06723770321fd441977c"

RSpec.describe "compiling assets using non-digest-assets", type: :aruba do
  let(:digest_key) do
    if Sprockets::VERSION >= "4"
      SPROCKETS_4_DIGEST
    else
      SPROCKETS_3_DIGEST
    end
  end

  let(:rails_new_flags) do
    flags = '--skip-bundle --skip-test-unit --skip-spring --skip-bootsnap'
    flags += ' --skip-listen --skip-webpack-install' if Rails::VERSION::MAJOR >= 6
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
