class AddColumnToAdress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :sender_family_name, :string, null: false
    add_column :addresses, :sender_first_name, :string, null: false
    add_column :addresses, :sender_family_kana, :string, null: false
    add_column :addresses, :sender_first_kana, :string, null: false
  end
end
