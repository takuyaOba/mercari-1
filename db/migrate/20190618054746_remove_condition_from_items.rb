class RemoveConditionFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :condition, :string
    remove_column :items, :delivery_burden, :string
    remove_column :items, :delivery_way, :string
    remove_column :items, :delivery_days, :string
  end
end
