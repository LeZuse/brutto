FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "xeedus.#{n}@gmail.com" }
    name 'Lukáš Voda'
    password 'heyhou'
    agenda
  end
end
