class InvoiceLine < ActiveRecord::Base
  # Associations
  # ============
  belongs_to :invoice

  # Scopes
  # ======
  scope :with_profit, -> {
    order(:id).
      select(arel_table[Arel.star], total_profit_col.as('total_profit'))
  }

  # Class methods
  # =============
  class << self
    # unit_price - cost
    def profit_col
      Arel::Nodes::Subtraction.new price_without_vat,
                                   arel_table[:cost]
    end

    # quantity * (unit_price - cost)
    def total_profit_col
      arel_table[:quantity] * Arel::Nodes::Grouping.new(profit_col)
    end

    def total_amount_col
      arel_table[:quantity] * arel_table[:unit_price]
    end

    # quantity * unit_price * vat / 100.0
    def tax_amount_col
      arel_table[:unit_price] * arel_table[:vat] / Arel.sql('100.0')
    end

    def total_tax_amount_col
      arel_table[:quantity] * tax_amount_col
    end

    def price_without_vat
      arel_table[:unit_price] - tax_amount_col
    end
  end
end
