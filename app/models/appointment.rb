class Appointment < ApplicationRecord
    # belongs_to :case
    # belongs_to :bi 
    # belongs_to :client
    scope :order_by_date, -> { order(date: :DESC)}

    belongs_to :case
    has_many :comments
    has_many :users, through: :comments
    # belongs_to rendered b.i 
    validates :from_time, presence: true
    validates :to_time, presence: true
    validates :date, presence: true

end

# User.all[0].appointments.uniq