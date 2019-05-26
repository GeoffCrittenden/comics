class CreateComicBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :comic_books, primary_key: :comic_book_id do |t|
      t.integer :variant_id
      t.integer :certification_id
      t.integer :purchase_id
      t.integer :sale_id

      t.timestamps
    end

    add_foreign_key :comic_books, :variants,       primary_key: :variant_id
    add_foreign_key :comic_books, :certifications, primary_key: :certification_id
    add_foreign_key :comic_books, :purchases,      primary_key: :purchase_id

    add_foreign_key :certifications, :comic_books, primary_key: :comic_book_id
  end
end
