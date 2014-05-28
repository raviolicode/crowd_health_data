class AddWaitingTimesToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :wait_general, :decimal
    add_column :providers, :wait_pediatrician, :decimal
    add_column :providers, :wait_gynecologist, :decimal
    add_column :providers, :wait_surgery, :decimal
    add_column :providers, :department_id, :integer
  end
end
