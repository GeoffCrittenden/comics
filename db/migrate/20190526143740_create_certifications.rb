class CreateCertifications < ActiveRecord::Migration[5.2]
  def change
    create_table :certifications, primary_key: :certification_id do |t|
      t.integer :comic_book_id
      t.integer :certification_service_id
      t.integer :grade_id
      t.integer :certification_label_id
      t.integer :page_color_id            
      t.text    :description,    comment: 'Anything noteworthy (i.e., first appearance, death of character, etc.)'
      t.text    :grader_notes,   comment: 'explanatory notes justifying grade given'
      t.boolean :cbcs_checkmark, comment: 'applies to CBCS only, used to denote a book that presents better than its grade'

      t.timestamps
    end

    add_foreign_key :certifications, :certification_services, primary_key: :certification_service_id
    add_foreign_key :certifications, :grades,                 primary_key: :grade_id
    add_foreign_key :certifications, :certification_labels,   primary_key: :certification_label_id
    add_foreign_key :certifications, :page_colors,            primary_key: :page_color_id
  end
end
