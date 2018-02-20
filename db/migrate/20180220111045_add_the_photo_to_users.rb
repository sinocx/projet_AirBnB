class AddThePhotoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :photo, :string
    add_column :products, :photo, :string
  end
end
