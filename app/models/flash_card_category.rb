class FlashCardCategory < ApplicationRecord
  acts_as_tree
  has_many :flash_cards

  def to_param
    name
  end
end
