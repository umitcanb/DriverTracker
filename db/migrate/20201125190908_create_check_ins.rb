class CreateCheckIns < ActiveRecord::Migration[6.0]
  def change
    create_table :check_ins do |t|
      t.date :date
      t.float :hours

      t.timestamps
    end
  end
end
