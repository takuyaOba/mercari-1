class CreateSizeCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :size_categories do |t|
      t.string   :size_category
      t.timestamps
    end
  end
end
