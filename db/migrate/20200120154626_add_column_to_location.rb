class AddColumnToLocation < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :capacity, :integer
    add_column :locations, :city, :string
  end
end
