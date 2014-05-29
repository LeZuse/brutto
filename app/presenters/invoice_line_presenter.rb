class InvoiceLinePresenter < ApplicationPresenter
  def total_profit
    quantity * profit
  end

  def profit
    unit_price_without_vat - cost
  end

  def vat_amount
    unit_price - unit_price_without_vat
  end

  def unit_price_without_vat
    (unit_price / (vat / 100.0 + 1)).round(2)
  end
end
