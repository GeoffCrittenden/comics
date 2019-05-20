class CreateCertificationLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :certification_labels, primary_key: :certification_label_id do |t|
      t.integer :certification_service_id
      t.string  :name
      t.string  :color

      t.timestamps
    end

    add_foreign_key :certification_labels, :certification_services, primary_key: :certification_service_id
  end
end
