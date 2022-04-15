class Package < ApplicationRecord
  belongs_to :technology

  def to_param
    name
  end
end
