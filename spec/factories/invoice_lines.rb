# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invoice_line do
    quantity "9.99"
    unit_price "9.99"
    vat "9.99"
    cost "9.99"
  end
end
