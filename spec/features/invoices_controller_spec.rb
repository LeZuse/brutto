require 'spec_helper'

describe 'InvoicesController' do

  describe 'GET /' do
    it 'lists all invoices' do

    end
  end

  describe 'PUT /' do
    let(:invoices) {
      
    }

    before do
      login_as create(:user)

      invoices_resource = double("invoices", all: OpenStruct.new)

      allow(BillApp::ResourceFactory).to receive(:resource_for) { invoices_resource }
    end

    it 'fetches invoices from BillApp' do
      visit invoices_path
      click_link 'Synchronizovat'
    end
  end
end
