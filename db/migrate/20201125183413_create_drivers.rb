class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :city

      t.timestamps
    end
  end
end
