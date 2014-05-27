require 'spec_helper'

describe 'InvoicesController' do

  describe 'GET /' do
    it 'lists all invoices' do

    end
  end

  describe 'PUT /synchronize' do
    let(:user) { create(:user) }

    before do
      login_as user
      bill_app_api_mock 'invoices'
    end

    it 'fetches invoices from BillApp', js: true do
      visit invoices_path
      click_link 'Synchronizovat'
      expect(Invoice.all.size).to eq(3)
    end
  end
end
