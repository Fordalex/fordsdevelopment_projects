class FlashCardCategory < ApplicationRecord
  has_many :flash_cards

  def to_param
    name
  end
end
