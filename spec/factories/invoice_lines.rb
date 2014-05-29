FactoryGirl.define do
  factory :invoice_line do
    quantity '2'
    unit_price { rand(10000) + 4000 }
    vat { [0, 15, 21][rand(3)] }
    cost { rand(15000) }
    invoice
  end
end
