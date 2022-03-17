class AddTypesToTechnologies < ActiveRecord::Migration[6.1]
  def change
    add_reference :technologies, :technology_type
  end
end
