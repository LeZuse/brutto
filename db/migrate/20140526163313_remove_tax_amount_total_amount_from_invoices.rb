class RemoveTaxAmountTotalAmountFromInvoices < ActiveRecord::Migration
  def up
    remove_column :invoices, :tax_amount
    remove_column :invoices, :total_amount
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
