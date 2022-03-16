class Project < ApplicationRecord
  has_many :features
  has_many :technology_groups
end
