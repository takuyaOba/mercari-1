class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :city,              null: false
      t.string :address,               null: false
      t.string :building
      t.string :zip_code,                      null: false
      t.string :point_amount
      t.string :profit_amount
      t.references :users, foreign_key: true
      t.timestamps
    end
  end
end