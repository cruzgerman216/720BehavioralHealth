class BehavioralTherapist < ApplicationRecord
    belongs_to :behavioral_therapist, foreign_key: 'bi_id', class_name: 'User'

end
