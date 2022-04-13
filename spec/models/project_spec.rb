# frozen_string_literal: true

require "rails_helper"

RSpec.describe Project, type: :model do
  it { should have_many(:features) }
  it { should have_many(:technology_groups) }
  it { should have_many(:plans) }
  it { should have_many(:descriptions) }

  describe "#technologies" do
    let(:project) { FactoryBot.create(:project) }

    before do
      technology_type = FactoryBot.create(:technology_type, name: "frontend")
      technology = FactoryBot.create(:technology, name: "html", technology_type: technology_type)
      technology_group = FactoryBot.create(:technology_group, technology_groupable: project, technology: technology)
    end

    it "should return all the technologies names attached to a project" do
      expect(project.technologies).to eq ["html"]
    end
  end
end
