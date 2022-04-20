class Project < ApplicationRecord
  # has many
  has_many :features
  has_many :technology_groups, as: :technology_groupable, dependent: :destroy
  has_many :plans
  has_many :descriptions
  # validation
  validates_uniqueness_of :name

  def self.all_visible
    Project.where(visible: true)
  end

  def to_param
    name
  end

  def completed_features
    features.where(completed: true)
  end

  def features_left_to_implement
    features.where(completed: false)
  end

  def technology_names
    technology_groups.map { |tg| tg.technology.name }
  end

  def technologies
    technology_groups.map { |tg| tg.technology }
  end

  def theme_colour_first
    theme_colours.split(",").first
  end
end
