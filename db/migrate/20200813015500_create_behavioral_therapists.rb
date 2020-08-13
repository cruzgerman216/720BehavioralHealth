class CreateBehavioralTherapists < ActiveRecord::Migration[6.0]
  def change
    create_table :behavioral_therapists do |t|
      t.integer :bi_id
      t.integer :user_id

      t.timestamps
    end
  end
end
