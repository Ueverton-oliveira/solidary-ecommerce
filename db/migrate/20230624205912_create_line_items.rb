class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.integer :status
      t.decimal :payed_price, precision: 10, scale: 2
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
