class RemovePointAmountFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :point_amount
    remove_column :addresses, :profit_amount
  end
end
