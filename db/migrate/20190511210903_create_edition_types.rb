class CreateEditionTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :edition_types, primary_key: :edition_type_id do |t|
      t.string :edition_type, comment: 'Most commonly either newsstand or direct'

      t.timestamps
    end
  end
end
