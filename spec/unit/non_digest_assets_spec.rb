# frozen_string_literal: true

require "spec_helper"
require "non-digest-assets"

RSpec.describe NonDigestAssets do
  describe ".asset_selectors" do
    it "returns what was set with .asset_selectors=" do
      described_class.asset_selectors = %w[baz qux]
      expect(described_class.asset_selectors).to eq %w[baz qux]
    end
  end

  describe ".filter_assets" do
    it "returns its arguments if there are no selected assets" do
      described_class.asset_selectors = []
      expect(described_class.filter_assets(%w[foo bar])).to eq %w[foo bar]
    end

    it "returns only selected parts of arguments if there are selected assets" do
      described_class.asset_selectors = %w[bar baz]
      expect(described_class.filter_assets(%w[foo bar])).to eq ["bar"]
    end

    it "allows filtering using a regex" do
      described_class.asset_selectors = [/ba/]
      expect(described_class.filter_assets(%w[foo bar ababa])).to eq %w[bar ababa]
    end
  end
end
