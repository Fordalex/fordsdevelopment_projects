class Package < ApplicationRecord
  belongs_to :technology
  validates_uniqueness_of :name

  def to_param
    name
  end
end
