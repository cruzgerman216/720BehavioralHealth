class Case < ApplicationRecord
    belongs_to :pc, foreign_key: 'pc_id', class_name: 'User'
    belongs_to :client, foreign_key: 'client_id', class_name: 'User'
    has_many :bis, through: :users

end
