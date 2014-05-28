require 'spec_helper'

describe 'InvoicesController' do
  let(:user) { create(:user) }

  before do
    login_as user
    bill_app_api_mock 'invoices'
  end

  describe 'GET /' do
    it 'allows user to edit costs', js: true do
      visit invoices_path
      create(:invoice)
      first('.invoices .show-lines').click
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
