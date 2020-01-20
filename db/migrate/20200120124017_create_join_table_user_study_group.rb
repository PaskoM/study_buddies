class CreateJoinTableUserStudyGroup < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :study_groups do |t|
      # t.index [:user_id, :study_group_id]
      # t.index [:study_group_id, :user_id]
    end
  end
end
