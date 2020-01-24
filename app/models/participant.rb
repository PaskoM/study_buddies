class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :study_group

  validate :number_of_participants

def number_of_participants
  unless self.study_group == nil
    if self.atendees >= self.places 
    errors.add(:full, "This study group is now full")
    end
  end 
end

def places
  unless self.study_group == nil
  places = self.study_group.num_participants
  end
end

def atendees
  unless self.study_group == nil
  atendees = self.study_group.participants.count + 1
  end
end


# def num_signed
#   self.participants.count
# end

# def num_places_left 
#   num_participants - num_signed
# end 


end 
