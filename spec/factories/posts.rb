FactoryBot.define do
  factory :post, aliases: [:owners_post] do
    content {"today's happy"}
    association :owner
    association :day
  end
end
