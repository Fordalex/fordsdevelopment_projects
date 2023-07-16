class FlashCardSubCategory < ApplicationRecord
  belongs_to :flash_card_category
  has_many :flash_cards

  def to_param
    name
  end
end
