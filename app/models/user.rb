class User < ApplicationRecord
    has_many :participants, dependent: :delete_all 
    has_many :study_groups, dependent: :delete_all 
    has_many :study_groups, through: :participants, dependent: :delete_all 
    has_secure_password 

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    validates :password, presence: true 
end
