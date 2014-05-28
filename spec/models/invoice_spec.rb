require 'spec_helper'

describe Invoice do
  it 'sums up profit of line items as total_profit' do
    invoice = create(:invoice)

    create(:invoice_line, invoice: invoice, cost: 10, unit_price: 20, quantity: 2) # profit 2 x 10 = 20
    create(:invoice_line, invoice: invoice, cost: 5, unit_price: 10, quantity: 3)  # profit 3 x  5 = 15
                                                                                   # total_profit  = 35


    invoice = Invoice.with_profit.last
    puts invoice.total_profit.to_s
    binding.pry
    expect(invoice.total_profit).to eq(BigDecimal(35))
  end
end
