class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image
      t.string :title
      t.string :description
      t.string :price
      t.integer :category_id
      t.integer :model_id
      t.integer :color_id

      t.timestamps
    end
  end
end
