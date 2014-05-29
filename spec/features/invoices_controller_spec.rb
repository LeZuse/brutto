require 'spec_helper'

describe 'InvoicesController' do
  let(:user) { create(:user) }
  let(:agenda) { user.agenda }

  before do
    login_as user
    bill_app_api_mock 'invoices'
  end

  describe 'GET /' do
    before do
      create_list(:invoice, 3, :with_lines, agenda: agenda)
    end

    it 'allows user to edit costs', js: true do
      invoice = create(:invoice, agenda: agenda)
      line_1 = create(:invoice_line, invoice: invoice, cost: nil, unit_price: 345, vat: 15)
      line_2 = create(:invoice_line, invoice: invoice, cost: 300, unit_price: 726, vat: 21)

      visit invoices_path
      within "\#invoice_#{invoice.id}" do
        find('.show-lines').click
        find('.submit .btn').click
        cost_inputs = all('.cost-edit input[type=number]')
        cost_inputs[0].set 250
        cost_inputs[1].set 620

        click_button 'Upravit fakturu'
      end

      expect(line_1.reload.cost).to eq(250)
      expect(line_2.reload.cost).to eq(620)
    end
  end

  describe 'PUT /synchronize' do
    it 'fetches invoices from BillApp', js: true do
      visit invoices_path
      click_link 'Synchronizovat'
      expect(Invoice.all.size).to eq(3)
    end
  end
end
