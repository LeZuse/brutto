require 'spec_helper'

describe Invoice do
  it 'sums up profit of invoice lines as total_profit' do
    invoice = create(:invoice)

    create(:invoice_line, invoice: invoice, cost: 10, unit_price: 20, quantity: 2, vat: 0) # profit 2 x 10 = 20
    create(:invoice_line, invoice: invoice, cost: 5, unit_price: 10, quantity: 3, vat: 0)  # profit 3 x  5 = 15
                                                                                           # total_profit  = 35


    invoice_with_profit = Invoice.with_profit.find(invoice.id)
    expect(invoice_with_profit.total_profit).to eq(BigDecimal(35))
  end

  it 'sums up profit of invoice lines as total_profit taking VAT into account' do
    invoice = create(:invoice)

    create(:invoice_line, invoice: invoice, cost: 80, unit_price: 121, quantity: 2, vat: 21)   # profit 2 x 20  = 40
    create(:invoice_line, invoice: invoice, cost: 300, unit_price: 460, quantity: 4, vat: 15)  # profit 4 x 100 = 400
                                                                                               # total_profit   = 440


    invoice_with_profit = Invoice.with_profit.find(invoice.id)
    expect(invoice_with_profit.total_profit).to eq(BigDecimal(440))
  end
end
