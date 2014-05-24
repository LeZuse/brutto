class AddHasVatToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :has_vat, :boolean, null: false
  end
end
