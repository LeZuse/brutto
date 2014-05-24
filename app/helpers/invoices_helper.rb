module InvoicesHelper
  def invoice_attribute attr
    Invoice.human_attribute_name attr
  end
end
