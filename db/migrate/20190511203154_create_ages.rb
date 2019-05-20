class CreateAges < ActiveRecord::Migration[5.2]
  def change
    create_table :ages, primary_key: :age_id do |t|
      t.string :name,       comment: 'Name of age, e.g., Golden, Silver, Bronze, etc.'
      t.date   :start_date, comment: 'Date that is universally accepted as the start of the age'
      t.date   :end_date,   comment: 'Date that is universally accepted as the end of the age'

      t.index :name,       unique: true
      t.index :start_date, unique: true

      t.timestamps
    end
  end
end
