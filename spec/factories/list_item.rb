FactoryGirl.define do
  factory :list_item do
    association :product
    association :list
    quantity 1
  end
end
