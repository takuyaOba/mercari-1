class AddConditionToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :condition, :string, null: false
    add_column :items, :delivery_burden, :string, null: false
    add_column :items, :delivery_way, :string, null: false
    add_column :items, :prefecture, :string, null: false
    add_column :items, :delivery_days, :string, null: false
  end
end
