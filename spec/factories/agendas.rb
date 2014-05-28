FactoryGirl.define do
  factory :agenda do
    sequence(:name) { |n| "xeed#{n}" }
  end
end
