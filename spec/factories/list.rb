FactoryGirl.define do
  factory :list do
    name "Mercado"

    trait :complete do
      after :build do |list|
        list.list_items << create(:list_item, list: list)
      end
    end
  end
end
