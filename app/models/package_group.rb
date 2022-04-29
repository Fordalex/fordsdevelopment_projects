class PackageGroup < ApplicationRecord
  belongs_to :package_groupable, polymorphic: true
  belongs_to :package
end
