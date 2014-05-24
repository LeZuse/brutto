class AddDescriptionToInvoiceLines < ActiveRecord::Migration
  def change
    add_column :invoice_lines, :description, :string
  end
end
