class RemoveItemIdFromSecondCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :second_categories, :item_id, :integer
  end
end
