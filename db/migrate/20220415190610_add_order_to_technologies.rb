class AddOrderToTechnologies < ActiveRecord::Migration[6.1]
  def change
    add_column :technologies, :order, :integer
  end
end
