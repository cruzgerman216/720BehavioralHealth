class User < ApplicationRecord
    has_many :casebis
    has_many :cases, :through => :casebis 
    
    has_many :comments
    has_many :commented_appointments, through: :comments, source: :appointment
    
    has_many :appointments, through: :comments

    enum role: [:program_coordinator, :behavioral_therapist, :client]

    has_secure_password 
    validates :email, :first_name, :last_name, presence: true
    validates_uniqueness_of :email
end