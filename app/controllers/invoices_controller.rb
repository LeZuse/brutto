class InvoicesController < ApplicationController
  def index
    @invoices = invoices.
        with_totals.
        with_profit.
        preload(:lines)
  end

  def synchronize
    InvoiceSynchronizationService.
        new(current_user, bill_app_password).
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
    @invoice ||= invoices.find(params[:id])
  end

  def bill_app_password
    session[:bill_app_api_password]
  end

  def invoices
    current_user.invoices
  end
end
