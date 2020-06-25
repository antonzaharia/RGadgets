class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :line_1
      t.string :line_2
      t.string :city
      t.string :postcode
      t.string :country
      t.integer :user_id

      t.timestamps
    end
  end
end
