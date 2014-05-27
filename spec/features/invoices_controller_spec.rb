require 'spec_helper'

describe 'InvoicesController' do

  describe 'GET /' do
    it 'lists all invoices' do

    end
  end

  describe 'PUT /' do
    let(:user) { create(:user) }

    before do
      login_as user
      bill_app_api_mock 'invoices'
    end

    it 'fetches invoices from BillApp' do
      visit invoices_path
      click_link 'Synchronizovat'
    end
  end
end
