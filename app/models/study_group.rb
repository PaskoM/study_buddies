class StudyGroup < ApplicationRecord
  belongs_to :user_organiser
  belongs_to :location
  belongs_to :subject
  has_many :reviews
  has_many :comments 
  has_and_belongs_to_many :users
end
