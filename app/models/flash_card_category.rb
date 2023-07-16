class FlashCardCategory < ApplicationRecord
  has_many :flash_card_sub_categories
  has_many :flash_cards, through: :flash_card_sub_categories

  def to_param
    name
  end
end
