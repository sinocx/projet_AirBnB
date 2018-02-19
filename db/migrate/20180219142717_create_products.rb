class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :category
      t.references :user, foreign_key: true
      t.integer :price
      t.string :image
      t.string :address
      t.boolean :rent, :default => false

      t.timestamps
    end
  end
end
