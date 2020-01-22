class StudyGroup < ApplicationRecord
  belongs_to :user
  belongs_to :location
  belongs_to :subject
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :users, through: :participants, dependent: :destroy

  # validates :num_participants, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  validates :description, presence: true, length: { maximum: 300 }
  validates :name, presence: true
  validates :subject, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :duration, presence: true
  validates :num_participants, presence: true
  
  # validate :number_of_participants
  validate :date_cannot_be_in_the_past
  validate :location_capacity



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
    if self.date
      if self.date < Date.today
          errors.add(:date, "must be in the future")
      end
    end
  end 

  def location_capacity
    if self.num_participants
      if self.location.capacity < self.num_participants
          errors.add(:capacity, "the chosen room is too small" )
      end
    end
  end 

  # def number_of_participants
  #   if num_signed > num_participants 
  #   errors.add(:full, "This study group is now full")
  #   end 
  # end
end
