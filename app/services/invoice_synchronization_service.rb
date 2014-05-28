class InvoiceSynchronizationService
  def initialize(user, password)
    @agenda = user.agenda
    @resource = BillApp::ResourceFactory.resource_for(user, password, 'invoice')
  end

  def synchronize
    Invoice.transaction do
      remote_invoices.each do |invoice|
        synchronize_invoice(invoice)
      end
    end
  end


  private

  attr_reader :resource, :agenda

  def remote_invoices
    resource.all
  end

  def synchronize_invoice(bill_app_invoice)
    invoice = Invoice.find_or_initialize_by(id: bill_app_invoice.id)

    invoice.assign_attributes agenda_id: agenda.id,
                              original_created_at: bill_app_invoice.created_at,
                              original_updated_at: bill_app_invoice.updated_at,
                              number: bill_app_invoice.number,
                              issue_date: bill_app_invoice.issue_date,
                              paid_on: bill_app_invoice.paid_on,
                              currency: bill_app_invoice.currency,
                              has_vat: bill_app_invoice.has_vat

    synchronize_invoice_lines(invoice, bill_app_invoice.lines)

    invoice.tap(&:save)
  end

  def synchronize_invoice_lines(invoice, lines)
    item_ids = lines.map(&:item_id).compact
    descriptions = lines.map(&:description).compact

    # Delete lines that were not found
    invoice.lines.to_a.
        delete_if { |il| item_ids.include?(il.item_id) || descriptions.include?(il.description) }.
        each(&:destroy)

    # TODO request to change API to include real InvoiceLine ID
    lines.each { |bill_app_line|
      line = invoice.lines.find_or_initialize_by bill_app_line.item_id.nil? ?
                                              {description: bill_app_line.description} :
                                              {item_id: bill_app_line.item_id}

      line.assign_attributes item_id: bill_app_line.item_id,
                             description: bill_app_line.description,
                             quantity: bill_app_line.quantity,
                             unit_price: bill_app_line.unit_price,
                             vat: bill_app_line.vat

    }
  end
end
