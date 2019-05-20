class CreateContributions < ActiveRecord::Migration[5.2]
  def change
    create_table :contributions, primary_key: :contribution_id do |t|
      t.integer :contribution_type_id
      t.integer :contributor_id
      t.integer :issue_id

      t.timestamps
    end

    add_foreign_key :contributions, :contribution_types, primary_key: :contribution_type_id
    add_foreign_key :contributions, :contributors,       primary_key: :contributor_id

    execute "CREATE UNIQUE INDEX contributions__u__contribution_type_id_contributor_id_issue_id ON contributions (contribution_type_id, contributor_id, issue_id)"
  end
end
