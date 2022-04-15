# frozen_string_literal: true

require "rails_helper"

RSpec.describe Plan, type: :model do
  describe "belong to" do
    it { should belong_to(:project) }
  end
end
