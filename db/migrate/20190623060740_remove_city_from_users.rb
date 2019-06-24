class RemoveCityFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :city
    remove_column :users, :adress
    remove_column :users, :building
    remove_column :users, :zip_code
  end
end
