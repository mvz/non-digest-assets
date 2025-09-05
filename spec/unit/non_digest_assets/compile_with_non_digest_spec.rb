# frozen_string_literal: true

require "spec_helper"
require "non-digest-assets"
require "tmpdir"
require "fileutils"

RSpec.describe NonDigestAssets::CompileWithNonDigest, type: :aruba do
  let(:assets) do
    [
      ["foo.css", "foo-deadbeef.css"],
      ["bar.css", "bar-f00df00d.css"]
    ]
  end

  let(:sprockets) do
    klass = Class.new do
      attr_reader :dir
      attr_reader :assets

      def initialize(asset_list)
        @dir = Dir.pwd
        @assets = asset_list
      end

      def compile
        files = assets.map { |(_, path)| "#{dir}/#{path}" }
        files.each { |file| make_asset file }
      end

      def logger
        @logger ||= Logger.new(StringIO.new)
      end

      private

      def make_asset(asset)
        FileUtils.touch asset
      end
    end
    klass.prepend described_class
    in_current_directory do
      klass.new assets
    end
  end

  before do
    NonDigestAssets.asset_selectors = []
  end

  describe "#compile" do
    it "returns the result of the super method" do
      result = sprockets.compile
      expect(result).to eq [
        expand_path("foo-deadbeef.css"),
        expand_path("bar-f00df00d.css")
      ]
    end

    context "when regular files for each asset exist but gzipped files do not" do
      it "creates only uncompressed non-digest versions for each asset" do
        sprockets.compile
        aggregate_failures do
          expect("foo.css").to be_an_existing_file
          expect("bar.css").to be_an_existing_file
          expect("foo.css.gz").not_to be_an_existing_file
          expect("bar.css.gz").not_to be_an_existing_file
        end
      end

      it "does not copy files for non-selected assets" do
        NonDigestAssets.asset_selectors = ["bar.css"]
        sprockets.compile
        aggregate_failures do
          expect("foo.css").not_to be_an_existing_file
          expect("bar.css").to be_an_existing_file
        end
      end
    end

    context "when no files exist for each asset" do
      before do
        sprockets.define_singleton_method :make_asset do |asset|
          # Do nothing
        end
      end

      it "does not create any non-digest versions for each asset" do
        sprockets.compile
        aggregate_failures do
          expect("foo.css").not_to be_an_existing_file
          expect("bar.css").not_to be_an_existing_file
          expect("foo.css.gz").not_to be_an_existing_file
          expect("bar.css.gz").not_to be_an_existing_file
        end
      end
    end

    context "when both regular and gzipped files exist for each asset" do
      before do
        sprockets.define_singleton_method :make_asset do |asset|
          FileUtils.touch asset
          FileUtils.touch "#{asset}.gz"
        end
      end

      it "creates both regular and gzipped non-digest versions for each asset" do
        sprockets.compile
        aggregate_failures do
          expect("foo.css").to be_an_existing_file
          expect("bar.css").to be_an_existing_file
          expect("foo.css.gz").to be_an_existing_file
          expect("bar.css.gz").to be_an_existing_file
        end
      end

      it "does not copy files for non-selected assets" do
        NonDigestAssets.asset_selectors = ["bar.css"]
        sprockets.compile
        aggregate_failures do
          expect("foo.css").not_to be_an_existing_file
          expect("bar.css").to be_an_existing_file
          expect("foo.css.gz").not_to be_an_existing_file
          expect("bar.css.gz").to be_an_existing_file
        end
      end
    end

    context "when logical path and digest path are the same" do
      let(:assets) { [%w[FOO FOO]] }

      it "keeps the already created version" do
        sprockets.compile
        expect("FOO").to be_an_existing_file
      end
    end
  end
end
