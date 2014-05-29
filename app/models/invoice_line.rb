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
    # quantity * unit_price
    def total_amount_col
      arel_table[:quantity] * arel_table[:unit_price]
    end

    # quantity * cost
    def total_cost_col
      arel_table[:quantity] * arel_table[:cost]
    end

    # [unit_price_without_vat] - cost
    # may require grouping when used as part of another calculation
    def profit_col
      Arel::Nodes::Subtraction.new unit_price_without_vat_col,
                                   arel_table[:cost]
    end

    # quantity * [profit]
    def total_profit_col
      arel_table[:quantity] * Arel::Nodes::Grouping.new(profit_col)
    end

    # unit_price - [unit_price_without_vat]
    def tax_amount_col
      arel_table[:unit_price] - unit_price_without_vat_col
    end

    # quantity * [tax_amount]
    def total_tax_amount_col
      arel_table[:quantity] * tax_amount_col
    end

    # round(unit_price / (vat / 100.0 + 1), 2)
    def unit_price_without_vat_col
      rounded arel_table[:unit_price] / vat_multiplier_col
    end

    # (vat / 100.0 + 1)
    def vat_multiplier_col
      calculation = Arel::Nodes::Addition.new arel_table[:vat] / Arel.sql('100.0'),
                                              Arel.sql('1')

      Arel::Nodes::Grouping.new(calculation)
    end

  private

    # round(..., X)
    def rounded(arel_node, decimal_places = 2)
      Arel::Nodes::NamedFunction.new 'round', [arel_node, decimal_places]
    end
  end
end
