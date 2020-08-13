class CreateRenders < ActiveRecord::Migration[6.0]
  def change
    create_table :renders do |t|
      t.boolean :rendered
      t.string :date

      t.timestamps
    end
  end
end
