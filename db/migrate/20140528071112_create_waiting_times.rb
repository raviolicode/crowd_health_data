class CreateWaitingTimes < ActiveRecord::Migration
  def change
    create_table :waiting_times do |t|
      t.references :specialty, index: true
      t.datetime :when
      t.integer :waiting
      t.references :provider, index: true
    end
  end
end
