# frozen_string_literal: true

require "rails_helper"

RSpec.describe FlashCardCategory, type: :model do
  describe "associations" do
    it { should have_many(:flash_cards) }
    it { should belong_to(:parent).class_name('FlashCardCategory').optional }
    it { should have_many(:children).class_name('FlashCardCategory').with_foreign_key('parent_id') }
  end
end
