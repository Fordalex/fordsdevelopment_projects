class Technology < ApplicationRecord
  has_many :technology_groups
  belongs_to :technology_type
end
