class StudyGroup < ApplicationRecord
  belongs_to :user
  belongs_to :location
  belongs_to :subject
  has_many :reviews
  has_many :comments
  has_many :participants 
  has_many :users, through: :participants 

  validates :num_participants, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  # validate :number_of_participants
  validate :date_cannot_be_in_the_past

  def self.filter(search_id)
    self.all.select do |sg|
      sg.subject.id == search_id
    end
  end

  def num_signed
    self.participants.count
  end

  def num_places_left 
    num_participants - num_signed
  end 

  def date_cannot_be_in_the_past
    if self.date < Date.today
        errors.add(:date, "Date must be in the future")
    end
  end 

  # def number_of_participants
  #   if num_signed > num_participants 
  #   errors.add(:full, "This study group is now full")
  #   end 
  # end
end
