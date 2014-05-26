class InvoiceLinePresenter < ApplicationPresenter
  def total_profit
    (unit_price - vat_amount - cost.to_i) * quantity
  end

  def vat_amount
    unit_price * vat / 100.0
  end
end
