class Project < ApplicationRecord
  # has many
  has_many :features
  has_many :technology_groups, as: :technology_groupable, dependent: :destroy
  has_many :technologies, through: :technology_groups
  has_many :package_groups, as: :package_groupable, dependent: :destroy
  has_many :packages, through: :package_groups
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
    technologies.map(&:name)
  end

  def package_names
    packages.map(&:name)
  end

  def theme_colour_first
    theme_colours.split(",").first
  end
end
