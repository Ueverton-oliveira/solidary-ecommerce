class AddWishItemToOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :wish_item, foreign_key: true
  end
end
