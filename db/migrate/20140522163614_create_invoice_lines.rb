class CreateInvoiceLines < ActiveRecord::Migration
  def change
    create_table :invoice_lines do |t|
      t.belongs_to :invoice, null: false

      t.decimal :quantity, null: false
      t.decimal :unit_price, null: false
      t.decimal :vat, null: false
      t.decimal :cost

      t.timestamps
    end
  end
end
