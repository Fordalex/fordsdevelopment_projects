# frozen_string_literal: true

require "rails_helper"

RSpec.describe Project, type: :model do
  describe "have many" do
    it { should have_many(:features) }
    it { should have_many(:technology_groups) }
    it { should have_many(:plans) }
    it { should have_many(:descriptions) }
  end

  describe "validation" do
    it { should validate_uniqueness_of(:name) }
  end

  let(:project) { FactoryBot.create(:project, name: "Fordsdevelopment") }

  describe "#to_param" do
    it "should return the project name" do
      expect(project.to_param).to eq "Fordsdevelopment"
    end
  end

  describe "#technologies" do
    let!(:technology) { FactoryBot.create(:technology, name: "html", technology_type: technology_type) }
    let!(:technology_type) { FactoryBot.create(:technology_type, name: "frontend") }

    context "when a project has a technology" do
      let!(:technology_group) { FactoryBot.create(:technology_group, technology_groupable: project, technology: technology) }

      it "should return all the technologies names attached to a project" do
        expect(project.technologies).to eq [technology]
      end
    end

    context "when a project hasn't got any technologies" do
      it "should return an empty array" do
        expect(project.technologies).to eq []
      end
    end
  end

  describe "#theme_colour_first" do
    let(:project) { FactoryBot.create(:project, theme_colours: theme_colours) }

    context "when there is more than one theme colour" do
      let(:theme_colours) { "#fff, #000" }
      it "should return the first theme colour" do
        expect(project.theme_colour_first).to eq "#fff"
      end
    end

    context "when there aren't any theme colours" do
      let(:theme_colours) { "" }
      it "should return nil" do
        expect(project.theme_colour_first).to eq nil
      end
    end
  end
end
