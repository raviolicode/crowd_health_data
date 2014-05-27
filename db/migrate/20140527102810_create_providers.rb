class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :full_name
      t.string :web
      t.string :address

      t.timestamps
    end
  end
end
