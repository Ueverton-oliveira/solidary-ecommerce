FactoryBot.define do
  factory :order_item do
    unit_price { 1.5 }
    quantity { 1 }
    total_price { 1.5 }
    produtc { nil }
    order { nil }
  end
end
