class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  add_column :users, :nickname, :string, null: false, unique: true
  add_column :users, :family_name, :string, null: false
  add_column :users, :first_name, :string, null: false
  add_column :users, :family_kana, :string, null: false
  add_column :users, :first_kana, :string, null: false
  add_column :users, :birth_year, :integer, null: false
  add_column :users, :birth_month, :integer, null: false
  add_column :users, :birth_day, :integer, null: false
  end
end
