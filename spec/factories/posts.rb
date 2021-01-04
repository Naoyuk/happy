FactoryBot.define do
  factory :post do
    content {"today's happy"}
    association :user
    association :day
  end
end
