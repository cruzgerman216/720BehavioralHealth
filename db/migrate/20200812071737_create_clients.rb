class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.integer :client_id
      t.integer :user_id

      t.timestamps
    end
  end
end
