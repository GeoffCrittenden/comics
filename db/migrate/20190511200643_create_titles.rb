class CreateTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :titles, primary_key: :title_id do |t|
      t.integer :publisher_id
      t.text    :title,          comment: 'Offical title of print run from indicia'
      t.integer :volume,         comment: 'Vol. 1, Vol. 2, etc.'
      t.integer :year_of_origin, comment: 'Year of the first issue within the title and volume'

      t.index %i[publisher_id title volume], unique: true

      t.timestamps
    end

    add_foreign_key :titles, :publishers, primary_key: :publisher_id
  end
end
