class CreateCases < ActiveRecord::Migration[6.0]
  def change
    create_table :cases do |t|
      t.integer :pc_id
      t.integer :client_id
      t.integer :bi_id
      
      t.timestamps
    end
  end
end
