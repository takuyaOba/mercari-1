class CreateSecondCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :second_categories do |t|
      t.references :first_category, foreign_key: true
      t.references :size_category,  foreign_key: true
      t.references :item, foreign_key: true
      t.string     :second_category, null: false
      t.timestamps
    end
  end
end


