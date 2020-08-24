class Appointmentcase < ApplicationRecord
    belongs_to :case 
    belongs_to :appointment
   
end
