class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :cpf
      t.string :phone
      t.string :cellphone
      t.string :street
      t.string :district
      t.string :number
      t.string :complement
      t.string :brazil_country
      t.string :city
      t.string :state
      t.string :zip_number
      t.integer :status
      t.float :subtotal
      t.float :total
      t.boolean :debit_card
      t.boolean :credit_card
      t.boolean :billet
      t.boolean :pix
      t.string :credit_card_number
      t.string :credit_card_name
      t.string :credit_card_expired_date
      t.string :credit_card_code

      t.timestamps
    end
  end
end
