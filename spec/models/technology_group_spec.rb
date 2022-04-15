# frozen_string_literal: true

require "rails_helper"

RSpec.describe TechnologyGroup, type: :model do
  describe "belongs to" do
    it { should belong_to(:technology_groupable) }
    it { should belong_to(:technology) }
  end
end
