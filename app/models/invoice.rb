class Invoice < ActiveRecord::Base
  # Associations
  # ============
  has_many :lines,
           class_name: 'InvoiceLine',
           autosave: true

  # Scopes
  # ======
  default_scope -> {
    order(issue_date: :desc, number: :desc)
  }

  scope :with_profit, -> {
    total_profit_sum = InvoiceLine.total_profit_col.sum

    joins(:lines).
        group(arel_table[:id]).
        select arel_table[Arel.star],
               total_profit_sum.as('total_profit')
  }

  scope :with_totals, -> {
    joins(:lines).
      group(arel_table[:id]).
      select arel_table[Arel.star],
             InvoiceLine.total_amount_col.sum.as('total_amount'),
             InvoiceLine.total_tax_amount_col.sum.as('tax_amount')
  }

  # Instance method
  # ===============
  def update_line_costs(line_params)
    line_params.each do |id, line|
      lines.find(id).update_column(:cost, line[:cost])
    end
  end
end
