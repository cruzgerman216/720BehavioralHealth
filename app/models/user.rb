class User < ApplicationRecord
    has_many :my_clients, foreign_key: :client_id, class_name: 'Client'
    has_many :clients, through: :my_clients, source: :client

    has_many :my_behavioral_therapists, foreign_key: :bi_id, class_name: 'BehavioralTherapist'
    has_many :behavioral_therapists, through: :my_behavioral_therapists, source: :behavioral_therapist

    has_many :my_program_coordinators, foreign_key: :pc_id, class_name: 'ProgramCoordinator'
    has_many :program_coordinators, through: :my_program_coordinators, source: :program_coordinator
 
    # has_many :cases
    has_many :appointments
    # belongs_to :role
    has_many :comments
    has_many :commented_appointments, through: :comments, source: :appointment
    has_many :renders
    # has_secure_password
    # has many clients 
    # has many p.cs
    # has many b.Is
end
