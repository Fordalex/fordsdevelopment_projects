# frozen_string_literal: true

require "rails_helper"

RSpec.describe Package, type: :model do
  describe "belong to" do
    it { should belong_to(:technology) }
  end
end
