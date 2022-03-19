class TechnologyGroup < ApplicationRecord
  # should be able to belong to project or features (polymorphic)
  belongs_to :technology_groupable, polymorphic: true
  belongs_to :technology
end
