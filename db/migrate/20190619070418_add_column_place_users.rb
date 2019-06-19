class AddColumnPlaceUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :city, :string, null: false
    add_column :users, :adress, :string, null: false
    add_column :users, :building, :string
    add_column :users, :zip_code, :integer, null: false
    add_column :users, :point_amount, :integer
    add_column :users, :profit_amount, :integer
    add_reference :users, :payment_information, foreign_key: true
  end
end
