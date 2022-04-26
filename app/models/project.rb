class Project < ApplicationRecord
  # has many
  has_many :features
  has_many :technology_groups, as: :technology_groupable, dependent: :destroy
  has_many :plans
  has_many :descriptions
  # validation
  validates_uniqueness_of :name
  # scopes
  scope :all_visible, -> { where(visible: true).order(:order) }

  # TODO Add packages to a project

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
    # This could be smarter? Delegate, scope?
    technology_groups.map { |tg| tg.technology.name }
  end

  def technologies
    technology_groups.map { |tg| tg.technology }
  end

  def theme_colour_first
    theme_colours.split(",").first
  end
end
