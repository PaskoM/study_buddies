class RemoveReviewFromStudyGroups < ActiveRecord::Migration[6.0]
  def change
    remove_reference :study_groups, :review, null: false, foreign_key: true
  end
end
