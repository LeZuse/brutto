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

  def update
    invoice.update_line_costs(params.require(:invoice).fetch(:lines))

    redirect_to :back,
                notice: t('invoices.messages.lines_updated')
  end


private

  def invoice
    @invoice ||= Invoice.find(params[:id])
  end
end
