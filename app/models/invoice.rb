class Invoice < ActiveRecord::Base
  # Associations
  # ============
  has_many :lines,
           class_name: 'InvoiceLine',
           autosave: true

  # Scopes
  # ======
  default_scope -> {
    order(issue_date: :desc)
  }

  scope :with_profit, -> {
    total_profit_sum = InvoiceLine.total_profit_col.sum

    select(arel_table[Arel.star], total_profit_sum.as('total_profit')).
        joins(:lines).
        group(arel_table[:id])
  }

  # Instance method
  # ===============
  def update_line_costs(line_params)
    line_params.each do |id, line|
      lines.find(id).update_column(:cost, line[:cost])
    end
  end
end
