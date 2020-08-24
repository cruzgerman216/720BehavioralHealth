class Appointment < ApplicationRecord
    # belongs_to :case
    # belongs_to :bi 
    # belongs_to :client
    belongs_to :case
    has_many :comments 
    # belongs_to rendered b.i 
    validates :from_time, presence: true
    validates :to_time, presence: true
    validates :date, presence: true

end
