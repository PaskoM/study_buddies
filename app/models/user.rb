class User < ApplicationRecord
    has_many :participants, dependent: :delete_all 
    has_many :study_groups, dependent: :delete_all 
    has_many :study_groups, through: :participants, dependent: :delete_all 
    has_secure_password 

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true 
    validates :password, presence: true 
end
