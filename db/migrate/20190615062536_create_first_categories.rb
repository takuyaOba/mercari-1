class CreateFirstCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :first_categories do |t|
      t.string :first_category, null: false
      t.timestamps
    end
  end
end
