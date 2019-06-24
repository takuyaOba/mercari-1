class ChangeNameAddressColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :users_id, :user_id
  end
end
