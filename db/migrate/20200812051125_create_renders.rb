class CreateRenders < ActiveRecord::Migration[6.0]
  def change
    create_table :renders do |t|
      t.boolean :rendered
      t.belongs_to :appointment
      t.belongs_to :user
      t.timestamps
    end
  end
end
