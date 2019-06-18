class AddCoiumnFirstId < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :first_category, foreign_key: true
  end
end
