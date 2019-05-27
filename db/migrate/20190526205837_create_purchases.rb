class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases, primary_key: :purchase_id do |t|
      t.integer :seller_id
      t.integer :purchase_type_id
      t.date    :date,     comment: 'date of purchase'
      t.text    :location, comment: 'location of purchase, if different from seller address or website'
      t.boolean :online,   comment: 'if purchased online or not'
      t.decimal :price,         precision: 7, scale: 2, comment: 'price paid minus shipping costs'
      t.decimal :shipping_cost, precision: 5, scale: 2, comment: 'cost to ship purchase, if applicable'
      t.text    :notes,    comment: 'any other relevant info about the purcahse'

      t.timestamps
    end

    add_foreign_key :purchases, :sellers,        primary_key: :seller_id
    add_foreign_key :purchases, :purchase_types, primary_key: :purchase_type_id
  end
end
