class CreateCasebis < ActiveRecord::Migration[6.0]
  def change
    create_table :casebis do |t|
      t.integer :bi_id
      t.string :case_id

      t.timestamps
    end
  end
end
