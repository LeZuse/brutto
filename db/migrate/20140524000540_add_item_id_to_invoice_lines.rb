class AddItemIdToInvoiceLines < ActiveRecord::Migration
  def change
    add_column :invoice_lines, :item_id, :integer
  end
end
