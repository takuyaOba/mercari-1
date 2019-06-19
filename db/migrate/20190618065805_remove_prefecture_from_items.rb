class RemovePrefectureFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :prefecture, :string

    add_column :items, :prefecture_id, :integer

    remove_column :items, :condition, :string
    remove_column :items, :delivery_burden, :string
    remove_column :items, :delivery_way, :string
    remove_column :items, :delivery_days, :string

    add_column :items, :condition_id, :integer
    add_column :items, :delivery_burden_id, :integer
    add_column :items, :delivery_way_id, :integer
    add_column :items, :delivery_days_id, :integer

    remove_column :users, :prefecture, :string
    add_column :users, :prefecture_id, :integer
  end
end
