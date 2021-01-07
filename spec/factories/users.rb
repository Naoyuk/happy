FactoryBot.define do
  factory :user, aliases: [:owner] do
    sequence(:name) { |n| "tester#{n}"}
    sequence(:email) { |n| "tester#{n}@example.com"}
    password {"Test1234"}
  end
end
