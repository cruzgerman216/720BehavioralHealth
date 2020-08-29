class Appointment < ApplicationRecord
    scope :order_by_date, -> {order(date: :DESC, from_to: :DESC)}

    belongs_to :case
    has_many :comments
    has_many :users, through: :comments
    
    validates :from_time, presence: true
    validates :to_time, presence: true
    validates :date, presence: true
    validate :from_to_error
    validate :overlapping_other_appointments
    validate :exceeded_limited_hours

    def from_to_error
        if self.from_time.strftime("%k:%M") >= self.to_time.strftime("%k:%M") 
            errors.add(:times, "do not make sense. #{self.from_time.strftime("%I:%M %p")} - #{self.to_time.strftime("%I:%M %p")}")
        end
    end

    def overlapping_other_appointments
        self.case.bi.appointments.each do |a|
            if a.date == self.date 
                if (a.from_time.strftime("%k").to_i..a.to_time.strftime("%k").to_i ).cover?(self.from_time.strftime("%k").to_i) || (a.from_time.strftime("%k").to_i..a.to_time.strftime("%k").to_i ).cover?(self.to_time.strftime("%k").to_i)
                    errors.add(:to_time, "#{self.from_time.strftime("%I:%M %p")} - #{self.to_time.strftime("%I:%M %p")} overlaps #{a.from_time.strftime("%I:%M %p")} - #{a.to_time.strftime("%I:%M %p")} ")
                end
            end
        end
    end

    def exceeded_limited_hours
        hours = self.to_time.strftime("%k:%M").to_i - self.from_time.strftime("%k:%M").to_i
        if hours < 2 
            errors.add(:limited_hours, "need at least 2 hours")
        elsif hours > 4
            errors.add(:limited_hours, "cannot go over 4 hours")
        end
    end

end
