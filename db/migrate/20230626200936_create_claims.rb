class CreateClaims < ActiveRecord::Migration[7.0]
  def change
    create_table :claims do |t|
      t.string :name
      t.text :subject
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
