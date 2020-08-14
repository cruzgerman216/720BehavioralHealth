class Case < ApplicationRecord
    belongs_to :pc
    belongs_to :client
    has_many :casebis
    has_many :bis, through: :casebis
end
