class Technology < ApplicationRecord
  # has many
  has_many :technology_groups
  has_many :packages
  # belongs to
  belongs_to :technology_type
  # validations
  validates_uniqueness_of :name


  def projects
    find_technolgoy_group_type("Project")
  end

  def features
    find_technolgoy_group_type("Feature")
  end

  def find_technolgoy_group_type(type)
    technology_groups.all.map do |tg|
      if tg.technology_groupable.class.name == type
        tg.technology_groupable
      end
    end.compact
  end
end
