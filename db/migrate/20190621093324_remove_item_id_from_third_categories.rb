class RemoveItemIdFromThirdCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :third_categories, :item_id, :integer
  end
end
