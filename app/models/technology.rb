class Technology < ApplicationRecord
  has_one :technology_group
  belongs_to :technology_type
end
