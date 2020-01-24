class CreateParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :participants do |t|
      t.references :user, null: false, foreign_key: true
      t.references :study_group, null: false, foreign_key: true

      t.timestamps
    end

    add_index :participants, [:user_id, :study_group_id], unique: true
  end
end
