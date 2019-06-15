class CreateThirdCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :third_categories do |t|
      t.string     :third_category, null: false
      t.references :second_category, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end


