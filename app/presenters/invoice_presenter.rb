class InvoicePresenter < ApplicationPresenter
  def row_class
    [
        total_profit > 0 && 'profit',
        total_profit < 0 && 'loss'

    ].reject { |klass| !klass }
  end
end
