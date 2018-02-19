class RemoveMailPasswordFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :mail
    remove_column :users, :password
  end
end
