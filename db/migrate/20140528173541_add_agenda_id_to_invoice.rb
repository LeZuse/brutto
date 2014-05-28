class AddAgendaIdToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :agenda_id, :integer, null: false
    add_index :invoices, :agenda_id
  end
end
