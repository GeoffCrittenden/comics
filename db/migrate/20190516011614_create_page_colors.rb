class CreatePageColors < ActiveRecord::Migration[5.2]
  def change
    create_table :page_colors, primary_key: :page_color_id do |t|
      t.string :description, comment: 'White, Off White, Off White to White, etc.'
      t.index  :description, unique: true

      t.timestamps
    end
  end
end
