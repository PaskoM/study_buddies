class User < ApplicationRecord
    has_many :participants, dependent: :destroy 
    has_many :study_groups, dependent: :destroy 
    has_many :study_groups, through: :participants, dependent: :destroy 
    has_secure_password 

    validates :name, presence: true
    validates :email, :uniqueness => true, on: :create
    validates :email, :presence => true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    validates :password, presence: true 

    def created_study_groups
        self.study_groups.select { |sg| sg.user == self } 
    end
end
