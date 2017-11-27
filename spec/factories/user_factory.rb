FactoryBot.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email 
    password "123456"
    first_name "jack"
    last_name "Black"
    admin false
  end

  factory :admin do
    admin true
  end
end

