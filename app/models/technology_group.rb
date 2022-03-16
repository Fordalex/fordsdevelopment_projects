class TechnologyGroup < ApplicationRecord
  belongs_to :project
  belongs_to :technology
end
