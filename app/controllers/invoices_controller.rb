class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
  end

  def synchronize
    InvoiceSynchronizationService.
        new(current_user, session[:bill_app_api_password]).
        synchronize

    redirect_to invoices_url,
                notice: t('invoices.messages.were_synchronized')
  end
end
