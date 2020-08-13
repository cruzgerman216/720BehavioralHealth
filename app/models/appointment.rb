class Appointment < ApplicationRecord
    has_many :comments 
    # belongs_to :behavioral_instructor, foreign_key :bi_id, class_name: "User"
    # belongs_to rendered b.i 
    # belongs_to rendered p.c 
    # belongs to b.i
    # belongs to p.c
    # belongs to client
end
