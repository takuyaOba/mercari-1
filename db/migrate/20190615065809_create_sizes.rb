class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
      t.string :size, null: false
      t.references :size_category, foreign_key: true
      t.timestamps
    end
  end
end
