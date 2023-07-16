# frozen_string_literal: true

require "rails_helper"

RSpec.describe FlashCardSubCategory, type: :model do
  describe "associations" do
    it { should belong_to(:flash_card_category) }
    it { should have_many(:flash_cards) }
  end
end
