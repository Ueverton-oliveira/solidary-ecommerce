class Product < ApplicationRecord
  has_one_attached :image do |attachable|
    attachable.variant :small_thumb, resize_to_limit: [300, 300]
    attachable.variant :thumb, resize_to_limit: [100, 100]
    attachable.variant :big_thumb, resize_to_limit: [600, 700]
  end
  belongs_to :category

  validates :name, :description, :price, presence: true

  def total
    products = Product.all

    products.each(&:price).sum
  end
end
