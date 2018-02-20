class RemoveTheImageFromProduct < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :img
    remove_column :products, :image
  end
end
