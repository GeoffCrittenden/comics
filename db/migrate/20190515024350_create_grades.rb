class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades, primary_key: :grade_id do |t|
      t.string :grade,        comment: 'Numeric grade of the comic book'
      t.string :name,         comment: 'Text name of the grade (e.g., Very Fine, Near Mint, Good, etc.)'
      t.string :abbreviation, comment: 'NM/MT, VG, F, etc.'

      t.index %i[grade name abbreviation], unique: true

      t.timestamps
    end
  end
end
