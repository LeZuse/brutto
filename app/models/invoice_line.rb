class InvoiceLine < ActiveRecord::Base
  class << self
    # unit_price - cost
    def profit_col
      Arel::Nodes::Subtraction.new arel_table[:unit_price],
                                   arel_table[:cost]
    end

    # quantity * (unit_price - cost)
    def total_profit_col
      arel_table[:quantity] * Arel::Nodes::Grouping.new(profit_col)
    end
  end
end
