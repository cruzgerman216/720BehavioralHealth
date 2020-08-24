class Bi < User
    has_many :casebis
    has_many :cases, :through => :casebis 

    has_many :appointments
    has_many :comments
end
