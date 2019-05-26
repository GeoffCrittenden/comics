class CreatePurchaseTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_types, primary_key: :purchase_type_id do |t|
      t.string :name, comment: 'unique name, e.g., retail, convention, auction, etc.'
      t.index  :name, unique: true

      t.timestamps
    end
  end
end
