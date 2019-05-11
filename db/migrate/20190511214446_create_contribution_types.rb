class CreateContributionTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :contribution_types, primary_key: :contribution_type_id do |t|
      t.string :name, comment: 'Writer, cover artist, penciler, inks, etc.'

      t.timestamps
    end
  end
end
