class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :name
      t.integer :max_waiting

      t.timestamps
    end
  end
end
