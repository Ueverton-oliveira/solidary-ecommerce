json.extract! order, :id, :status, :total_amount, :payment_type, :email, :product_id, :user_id, :address_id, :created_at, :updated_at
json.url order_url(order, format: :json)
