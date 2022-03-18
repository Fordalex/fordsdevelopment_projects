class TechnologyGroup < ApplicationRecord
  # should be able to belong to project or features (polymorphic)
  belongs_to :project
  belongs_to :technology
end
