class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues, primary_key: :issue_id do |t|
      t.integer :title_id
      t.integer :age_id
      t.integer :issue_number,         comment: 'Issue number, e.g., the 129 from Amazing Spider-Man 129'
      t.string  :issue_title,          comment: 'The title given to the individual issue by the writers.  Not always given.'
      t.string  :year_of_publication,  comment: 'Publication year listed in the indicia'
      t.string  :month_of_publication, comment: 'Publication month listed in the indicia'
      t.date    :date_of_publication,  comment: 'The actual date of public release, does not always match the indicia publication mon/year'
      t.integer :print_edition,        comment: 'The numbered print edition, unsually first, but popular issues have multiple print editions'

      t.timestamps
    end

    add_foreign_key :issues, :titles, primary_key: :title_id
    add_foreign_key :issues, :ages,   primary_key: :age_id
  end
end
