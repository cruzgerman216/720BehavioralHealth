class CreateAppointmentcases < ActiveRecord::Migration[6.0]
  def change
    create_table :appointmentcases do |t|
      t.integer :appointment_id
      t.integer :case_id

      t.timestamps
    end
  end
end
