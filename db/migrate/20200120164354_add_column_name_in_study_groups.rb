class AddColumnNameInStudyGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :study_groups, :name, :string
  end
end
