class CreateContributors < ActiveRecord::Migration[5.2]
  def change
    create_table :contributors, primary_key: :contributor_id do |t|
      t.string :first_name,  comment: 'First name of contributor'
      t.string :middle_name, comment: 'Middle name or initial of contributor'
      t.string :last_name,   comment: 'Last name of contributor'
      t.string :title,       comment: 'Sir, Dame, Mr., Ms., etc.'
      t.string :suffix,      comment: 'Jr., Sr., III, etc.'

      t.timestamps
    end
  end
end
