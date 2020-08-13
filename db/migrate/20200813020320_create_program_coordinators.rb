class CreateProgramCoordinators < ActiveRecord::Migration[6.0]
  def change
    create_table :program_coordinators do |t|
      t.integer :pc_id
      t.integer :user_id

      t.timestamps
    end
  end
end
