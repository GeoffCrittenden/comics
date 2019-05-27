class CreateSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :sellers, primary_key: :seller_id do |t|
      t.string :name,       comment: 'business name'
      t.index  :name,       unique: true
      t.string :proprietor, comment: 'full name of business owner, if applicable'
      t.text   :address,    comment: 'street address of business, if applicable'
      t.string :website,    comment: 'online presence'

      t.timestamps
    end
  end
end
