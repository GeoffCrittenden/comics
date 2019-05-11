class CreateVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :variants, primary_key: :variant_id do |t|
      t.integer :issue_id
      t.string  :variant_identifier,  comment: 'Usually designated as a letter, with the main variant being A and others being B thru Z'
      t.text    :variant_description, comment: 'Often used to denote the specific artist or other significant meaning for the variant'
      t.integer :edition_type_id

      t.timestamps
    end

    add_foreign_key :variants, :issues,        primary_key: :issue_id
    add_foreign_key :variants, :edition_types, primary_key: :edition_type_id
  end
end
