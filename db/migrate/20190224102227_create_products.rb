class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.string :color
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
