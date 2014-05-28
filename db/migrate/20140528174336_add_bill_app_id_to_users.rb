class AddBillAppIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bill_app_id, :integer, null: false
  end
end
