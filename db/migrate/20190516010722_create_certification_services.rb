class CreateCertificationServices < ActiveRecord::Migration[5.2]
  def change
    create_table :certification_services, primary_key: :certification_service_id do |t|
      t.string :name, comment: 'CGC, CBCS, PGX, etc.'
      t.index  :name, unique: true

      t.timestamps
    end
  end
end
