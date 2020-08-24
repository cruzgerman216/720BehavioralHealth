class Client < User
    has_one :case
    has_many :appointments
    has_many :comments
end
