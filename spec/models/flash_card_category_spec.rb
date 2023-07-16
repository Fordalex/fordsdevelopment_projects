# frozen_string_literal: true

require "rails_helper"

RSpec.describe FlashCardCategory, type: :model do
  describe "associations" do
    it { should have_many(:flash_cards).through(:flash_card_sub_categories) }
    it { should have_many(:flash_card_sub_categories) }
  end
end
