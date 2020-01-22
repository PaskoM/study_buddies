class Subject < ApplicationRecord
    has_many :study_groups, dependent: :destroy
end
