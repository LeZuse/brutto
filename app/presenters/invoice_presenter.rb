class InvoicePresenter < ApplicationPresenter
  def row_class
    [
        total_profit.to_i > 0 && 'profit',
        total_profit.to_i < 0 && 'loss',
        total_profit.to_i == 0 && 'no-cost-filled-in'

    ].reject { |klass| !klass }
  end
end
