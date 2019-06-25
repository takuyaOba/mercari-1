class ChangeColumnToCard < ActiveRecord::Migration[5.2]
  def change
    change_column :cards, :user_id, :integer, null: true
    change_column :cards, :customer_id, :string, null: true
    change_column :cards, :card_id, :string, null: true

  end
end
