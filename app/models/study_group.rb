class StudyGroup < ApplicationRecord
  belongs_to :user
  belongs_to :location
  belongs_to :subject
  has_many :reviews
  has_many :comments 
  has_many :users, through: :participats 
end
