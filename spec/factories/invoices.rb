# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invoice do
    original_created_at "2014-05-22 18:31:54"
    original_updated_at "2014-05-22 18:31:54"
    currency "MyString"
    issue_date "2014-05-22"
    paid_on "2014-05-22"
  end
end
