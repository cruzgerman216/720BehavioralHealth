class Bi < User
    has_many :casebis
    has_many :cases, :through => :casebis 
end
