class Package < ApplicationRecord
  # belongs to
  belongs_to :technology
  # has many
  has_many :technology_groups, as: :technology_groupable, dependent: :destroy
  has_many :package_groups, as: :package_groupable, dependent: :destroy
  # validates
  validates_uniqueness_of :name

  def to_param
    name
  end
end
