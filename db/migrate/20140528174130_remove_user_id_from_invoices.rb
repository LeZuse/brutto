class RemoveUserIdFromInvoices < ActiveRecord::Migration
  def up
    remove_column :invoices, :user_id
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
