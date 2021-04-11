class CreateToDos < ActiveRecord::Migration[5.2]
  def change
    create_table :to_dos do |t|
      t.string :day
      t.string :body
      t.integer :user_id

      t.timestamps
    end
  end
end
