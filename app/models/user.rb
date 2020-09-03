class User < ApplicationRecord
    has_many :cases, ->(user){
        unscope(:where).where(pc:user).or(where(client: user)).or(where(bi:user))
    }

    has_many :appointments, through: :cases



    has_many :comments
    # allows me to see what appointments I've commented on
    has_many :commented_appointments, through: :comments, source: :appointment
    
    enum role: [:program_coordinator, :behavioral_therapist, :client]

    has_secure_password 
    validates :email, :first_name, :last_name, presence: true
    validates_uniqueness_of :email

    def return_last_to_first_name 
        self.last_name + ", " + self.first_name
    end

    def return_initials
        self.first_name[0..1] + "." + self.last_name[0..1]
    end
end

# class User < ApplicationRecord
#     has_many :renders
#     has_many :rendered_appointments, through: :renders, source: :appointments
#   end

#   class appointment < ApplicationRecord
#     has_many :renders
#     has_many :users_rendered, through: :renders, source: :users
#   end
  
#   class render < ApplicationRecord
#     belongs_to :user
#     belongs_to :appointment
#   end
