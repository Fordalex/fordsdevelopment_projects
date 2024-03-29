# frozen_string_literal: true

require "rails_helper"

RSpec.describe Technology, type: :model do
  describe "have many" do
    it { should have_many(:packages) }
    it { should have_many(:technology_groups) }
  end

  describe "belong to" do
    it { should belong_to(:technology_type) }
  end

  describe "validation" do
    it { should validate_uniqueness_of(:name) }
  end

  let!(:technology_type) { FactoryBot.create(:technology_type, name: "Frontend") }
  let!(:technology) { FactoryBot.create(:technology, technology_type: technology_type) }
  let!(:project) { FactoryBot.create(:project) }
  let!(:feature) { FactoryBot.create(:feature, project: project) }
  let!(:technology_group_feature) { FactoryBot.create(:technology_group, technology_groupable: feature, technology: technology) }
  let!(:technology_group_project) { FactoryBot.create(:technology_group, technology_groupable: project, technology: technology) }

  describe "#projects" do
    it "should return projects" do
      expect(technology.projects).to eq [project]
    end
  end

  describe "#features" do
    it "should return features" do
      expect(technology.features).to eq [feature]
    end
  end
end
