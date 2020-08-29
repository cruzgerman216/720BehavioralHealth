class Case < ApplicationRecord
    belongs_to :pc, foreign_key: :pc_id, class_name: 'User'
    belongs_to :client, foreign_key: :client_id, class_name: "User"
    belongs_to :bi, foreign_key: :bi_id, class_name: "User"
    
    has_many :appointments

    scope :order_by_last_name, -> {joins(:client).group(:id).order(:last_name)}
end
