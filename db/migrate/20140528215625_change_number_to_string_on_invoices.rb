class ChangeNumberToStringOnInvoices < ActiveRecord::Migration
  def up
    change_column :invoices, :number, :string, null: false
  end

  def down
    change_column :invoices, :number, :integer, null: false
  end
end
