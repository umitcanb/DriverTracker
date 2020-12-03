class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :surname
      t.string :city
      t.boolean :admin, :default => false

      t.timestamps
    end
  end
end
