class CreateJoinTablePackagesProject < ActiveRecord::Migration[6.1]
  def change
    create_table :package_groups do |t|
      t.references :package
      t.references :package_groupable, polymorphic: true

      t.timestamps
    end
  end
end
