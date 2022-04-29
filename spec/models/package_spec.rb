# frozen_string_literal: true

require "rails_helper"

RSpec.describe Package, type: :model do
  describe "belong to" do
    it { should belong_to(:technology) }
  end

  describe "has many" do
    it { should have_many(:package_groups) }
  end

  describe "validates" do
    it { should validate_uniqueness_of(:name) }
  end
end
