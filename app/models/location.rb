class Location < ApplicationRecord
    has_many :study_groups, dependent: :destroy
end
