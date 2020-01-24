class RemoveOrganiserFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :organiser, :boolean
  end
end
