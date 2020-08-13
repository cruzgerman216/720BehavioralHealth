class Role < ApplicationRecord
    has_and_belongs_to_many :users
    has_and_belongs_to_many :rights
    validates :name, presence: true
end
