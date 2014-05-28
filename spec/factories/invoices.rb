FactoryGirl.define do
  factory :invoice do
    sequence(:number) { |n| "2014#{n.to_s.rjust(5, '0')}" }
    has_vat false
    original_created_at '2014-05-22 18:31:54'
    original_updated_at '2014-05-22 22:30:54'
    currency 'CZK'
    issue_date '2014-05-22'
    paid_on '2014-05-22'
    agenda
  end
end
