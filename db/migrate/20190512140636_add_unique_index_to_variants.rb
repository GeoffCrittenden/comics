class AddUniqueIndexToVariants < ActiveRecord::Migration[5.2]
  def change
    execute 'CREATE UNIQUE INDEX variants__u__issue_id_variant_identifier_edition_type_id ON variants (issue_id, variant_identifier, edition_type_id)'
  end
end
