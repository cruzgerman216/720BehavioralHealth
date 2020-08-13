class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :from_time
      t.string :to_time
      t.string :date

      t.timestamps
    end
  end
end
