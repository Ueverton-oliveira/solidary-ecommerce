FactoryBot.define do
  factory :order do
    status { 1 }
    total_amount { "9.99" }
    payment_type { 1 }
    email { "MyString" }
    product { nil }
    user { nil }
    address { nil }
  end
end
