class CreateContributions < ActiveRecord::Migration[5.2]
  def change
    create_table :contributions, primary_key: :contribution_id do |t|
      t.integer :contribution_type_id
      t.integer :contributor_id
      t.integer :issue_id

      t.timestamps
    end
  end
end
