require 'spec_helper'

describe InvoiceLine do
  describe 'class methods' do
    def pluck_virtual_column(invoice_line, class_method)
      InvoiceLine.
          where(id: invoice_line.id).
          pluck(InvoiceLine.send(class_method).to_sql).
          first
    end

    describe '.total_amount_col' do
      it 'equals quantity * unit_price' do
        invoice_line = create(:invoice_line, quantity: 3, unit_price: 100)

        total_amount = pluck_virtual_column(invoice_line, :total_amount_col)

        expect(total_amount).to eq(3 * 100)
      end
    end

    describe '.total_cost_col' do
      it 'equals quantity * cost' do
        invoice_line = create(:invoice_line, quantity: 4, cost: 50)

        total_cost = pluck_virtual_column(invoice_line, :total_cost_col)

        expect(total_cost).to eq(4 * 50)
      end
    end

    describe '.profit_col' do
      it 'equals unit_price_without_vat - cost' do
        invoice_line = create(:invoice_line, cost: 50, unit_price: 90, vat: 0)

        profit = pluck_virtual_column(invoice_line, :profit_col)

        expect(profit).to eq(40)
      end

      it 'equals unit_price_without_vat - cost (with VAT on invoice line)' do
        invoice_line = create(:invoice_line, cost: 50, unit_price: 121, vat: 21)

        profit = pluck_virtual_column(invoice_line, :profit_col)

        expect(profit).to eq(50)
      end
    end

    describe '.total_profit_col' do
      it 'equals quantity * profit' do
        invoice_line = create(:invoice_line, quantity: 3, cost: 50, unit_price: 90, vat: 0)

        profit = pluck_virtual_column(invoice_line, :total_profit_col)

        expect(profit).to eq(3 * 40)
      end

      it 'equals unit_price_without_vat - cost (with VAT on invoice line)' do
        invoice_line = create(:invoice_line, quantity: 3, cost: 50, unit_price: 121, vat: 21)

        profit = pluck_virtual_column(invoice_line, :total_profit_col)

        expect(profit).to eq(3 * 50)
      end
    end

    describe '.total_tax_amount_col' do
      it 'equals quantity * (unit_price - unit_price_without_vat)' do
        invoice_line = create(:invoice_line, quantity: 3, unit_price: 121, vat: 21)

        profit = pluck_virtual_column(invoice_line, :total_tax_amount_col)

        expect(profit).to eq(3 * 21)
      end
    end

    describe '.unit_price_without_vat_col' do
      it 'equals quantity * (unit_price - unit_price_without_vat)' do
        invoice_line = create(:invoice_line, unit_price: 121, vat: 21)

        profit = pluck_virtual_column(invoice_line, :unit_price_without_vat_col)

        expect(profit).to eq(100)
      end
    end
  end
end
