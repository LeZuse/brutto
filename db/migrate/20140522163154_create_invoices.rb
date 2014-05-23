class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.belongs_to :user, null: false

      t.datetime :original_created_at, null: false
      t.datetime :original_updated_at, null: false
      t.string :currency, null: false
      t.date :issue_date, null: false
      t.date :paid_on
      t.decimal :tax_amount
      t.integer :total_amount

      t.timestamps

      t.index :user_id
      t.index :original_created_at
    end
  end
end
