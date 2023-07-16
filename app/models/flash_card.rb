class FlashCard < ApplicationRecord
  belongs_to :flash_card_sub_category
  has_one :flash_card_category, through: :flash_card_sub_category
end
