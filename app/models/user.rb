class User < ApplicationRecord
    has_many :participants
    has_many :study_groups
    has_many :study_groups, through: :participants

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true 
    validates :password, presence: true 
end
