class Project < ApplicationRecord
  has_many :features
  has_many :technology_groups

  def completed_features
    features.where(completed: true)
  end

  def features_left_to_implement
    features.where(completed: false)
  end
end
