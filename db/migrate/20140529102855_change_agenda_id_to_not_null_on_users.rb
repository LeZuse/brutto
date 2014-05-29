class ChangeAgendaIdToNotNullOnUsers < ActiveRecord::Migration
  def up
    User.where(agenda_id: nil).delete_all
    change_column :users, :agenda_id, :integer, null: false
  end

  def down
    change_column :users, :agenda_id, :integer, null: true
  end
end
