class CreatePaymentInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_informations do |t|
      t.integer :card_number,              null: false
      t.integer :valid_year,               null: false
      t.integer :valid_month,              null: false
      t.integer :cvc,                      null: false
      t.timestamps
    end
  end
end
