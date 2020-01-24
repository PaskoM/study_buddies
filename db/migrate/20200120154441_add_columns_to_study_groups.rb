class AddColumnsToStudyGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :study_groups, :date, :date
    add_column :study_groups, :time, :time
    add_column :study_groups, :duration, :float
    add_column :study_groups, :num_participants, :integer
  end
end
