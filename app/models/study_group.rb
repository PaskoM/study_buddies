class StudyGroup < ApplicationRecord
  belongs_to :user
  belongs_to :location
  belongs_to :subject
  has_many :reviews
  has_many :comments
  has_many :participants 
  has_many :users, through: :participants 

  def self.filter(search_id)
    self.all.select do |sg|
      sg.subject.id == search_id
    end
  end
end
