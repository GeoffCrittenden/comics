class CreatePublisher < ActiveRecord::Migration[5.2]
  def change
    create_table :publishers, primary_key: :publisher_id do |t|
      t.string :name,      comment: 'Universally recognized name of the publisher (e.g., Marvel or DC)'
      t.string :full_name, comment: 'Official name of the publisher'

      t.timestamps
    end
  end
end
