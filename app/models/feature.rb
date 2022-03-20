class Feature < ApplicationRecord
  belongs_to :project
  has_many :technology_groups, as: :technology_groupable, dependent: :destroy

  def technologies
    technology_groups.map { |tg| tg.technology }
  end

  def technology_names
    technology_groups.map { |tg| tg.technology.name }
  end
end
