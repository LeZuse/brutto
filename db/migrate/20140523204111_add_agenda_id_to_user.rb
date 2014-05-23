class AddAgendaIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :agenda_id, :integer
    add_index :users, [:agenda_id, :email], unique: true
  end
end
