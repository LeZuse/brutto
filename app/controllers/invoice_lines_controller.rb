class InvoiceLinesController < ApplicationController
  before_filter :set_invoice

  def index
  end


private

  def set_invoice
    @invoice = Invoice.find(params[:invoice_id])
  end
end
