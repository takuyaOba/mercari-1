class AddSizeToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :second_category, foreign_key: true
    add_reference :items, :third_category, foreign_key: true
    add_reference :items, :brand, foreign_key: true
    add_reference :items, :size, foreign_key: true
  end
end
