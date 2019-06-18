class AddConditionIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :condition_id, :integer
    add_column :items, :delivery_burden_id, :integer
    add_column :items, :delivery_way_id, :integer
    add_column :items, :delivery_days_id, :integer
  end
end
