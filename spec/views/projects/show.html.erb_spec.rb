# frozen_string_literal

require "rails_helper"

RSpec.describe "projects/show", type: :view do
  let(:technology_group) { nil }
  let(:project) { FactoryBot.create(:project, technology_groups: technology_group) }

  before do
    assign(:project, project)
  end

  context "when a project has technologies" do
    let(:technology) { FactoryBot.create(:technology, name: "Javascript") }
    let(:technology_group) { FactoryBot.create_list(:technology, 1, technology_groupable: project, technology: technology) }

    it "displays the technologies" do
      render
    end
  end

  context "when a project doesn't have technologies" do
    it "doesn't display the technology container" do
      render
    end
  end
end
