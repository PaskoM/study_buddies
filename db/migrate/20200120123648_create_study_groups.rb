class CreateStudyGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :study_groups do |t|
      t.references :user, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
