# frozen_string_literal: true

require "rake"
require 'rspec/core/rake_task'
require "bundler/gem_tasks"
require "rake/clean"

CLEAN.include "fixtures/**/Gemfile.lock"
CLEAN.include "fixtures/**/public/assets"
CLOBBER.include "pkg"

desc "Default: run specs."
task default: :spec

namespace :spec do
  RSpec::Core::RakeTask.new(:unit) do |t|
    t.pattern = 'spec/unit/**/*_spec.rb'
  end

  RSpec::Core::RakeTask.new(:integration) do |t|
    t.pattern = 'spec/integration/**/*_spec.rb'
  end
end

task spec: ["spec:unit", "spec:integration"]
