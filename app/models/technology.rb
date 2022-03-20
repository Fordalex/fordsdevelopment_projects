class Technology < ApplicationRecord
  has_many :technology_groups
  belongs_to :technology_type
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

  def to_param
    name
  end
end
