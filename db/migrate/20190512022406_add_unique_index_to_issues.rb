class AddUniqueIndexToIssues < ActiveRecord::Migration[5.2]
  def change
    execute 'CREATE UNIQUE INDEX issues__u__title_id_issue_number_print_edition ON issues (title_id, issue_number, print_edition)'
  end
end
