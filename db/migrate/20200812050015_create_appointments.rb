class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.time :from_time
      t.time :to_time
      t.date :date
      t.integer :case_id
      t.timestamps
    end
  end
end
