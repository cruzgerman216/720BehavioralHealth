class User < ApplicationRecord
    # has_many :casebis
    # has_many :cases, :through => :casebis 
    
    has_many :comments
    has_many :commented_appointments, through: :comments, source: :appointment
    
    # has_many :appointments, through: :comments

    # has_many :running_cases, foreign_key: :pc_id, class_name: 'Case'

    has_many :kases, foreign_key: :pc_id,class_name:'Case'
    has_many :cases, ->(user){
        unscope(:where).where(pc:user).or(where(client: user)).or(where(bi:user))
    }
    has_many :appointments, through: :cases
    enum role: [:program_coordinator, :behavioral_therapist, :client]

    has_secure_password 
    validates :email, :first_name, :last_name, presence: true
    validates_uniqueness_of :email

    def return_last_to_first_name 
        self.last_name + ", " + self.first_name
    end
end