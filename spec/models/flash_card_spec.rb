# frozen_string_literal: true

require "rails_helper"

RSpec.describe FlashCard, type: :model do
  describe "association" do
    it { should belong_to(:flash_card_sub_category) }
  end
end
