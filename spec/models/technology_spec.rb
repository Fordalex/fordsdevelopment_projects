# frozen_string_literal: true

require "rails_helper"

RSpec.describe Technology, type: :model do
  # TODO add describe blocks to group associations.
  it { should have_many(:technology_groups) }
  it { should have_many(:packages) }
  it { should belong_to(:technology_type) }

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
