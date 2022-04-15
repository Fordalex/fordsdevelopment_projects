# frozen_string_literal: true

require "rails_helper"

RSpec.describe TechnologyType, type: :model do
  describe "have many" do
    it { should have_many(:technologies) }
  end
end
