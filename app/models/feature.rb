class Feature < ApplicationRecord
  # belongs to
  belongs_to :project
  # has many
  has_many :technology_groups, as: :technology_groupable, dependent: :destroy
  # validation
  validates_uniqueness_of :name

  # TODO add highlighted attribute
  # TODO add link attribute, for features that can't be display in the view.

  def to_param
    name
  end

  def technologies
    technology_groups.map { |tg| tg.technology }
  end

  def technology_names
    technology_groups.map { |tg| tg.technology.name }
  end
end
