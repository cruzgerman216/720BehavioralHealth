class Render < ApplicationRecord
    belongs_to :user
    belogns_to :appointment
end
