class AddDriverIdToCheckIns < ActiveRecord::Migration[6.0]
  def change
    add_column :check_ins, :driver_id, :integer
  end
end
