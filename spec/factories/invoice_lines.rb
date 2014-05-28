FactoryGirl.define do
  factory :invoice_line do
    quantity '2'
    unit_price '499.0'
    vat 0
    cost '300'
    invoice
  end
end
