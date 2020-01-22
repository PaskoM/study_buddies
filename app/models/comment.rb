class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :study_group

  validates :description, presence: true
end
