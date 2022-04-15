# frozen_string_literal: true

require "rails_helper"

RSpec.describe Feature, type: :model do
  describe "belong to" do
    it { should belong_to(:project) }
  end

  let(:feature) { FactoryBot.create(:feature) }
  let(:javascript) { FactoryBot.create(:technology, name: "Javascript") }

  describe "#technologies" do
    context "when a feature has technologies" do
      before do
        FactoryBot.create(:technology_group, technology_groupable: feature, technology: javascript)
      end

      it "returns an array containing the technologies" do
        expect(feature.technologies).to eq [javascript]
      end
    end

    context "when a feature doesn't have technologies" do
      it "returns an empty array" do
        expect(feature.technologies).to eq []
      end
    end
  end

  describe "#technology_names" do
    context "when a feature has technologies" do
      before do
        FactoryBot.create(:technology_group, technology_groupable: feature, technology: javascript)
      end

      it "returns an array containing the technology names" do
        expect(feature.technology_names).to eq ["Javascript"]
      end
    end

    context "when a feature doesn't have technologies" do
      it "returns an empty array" do
        expect(feature.technologies).to eq []
      end
    end
  end
end
