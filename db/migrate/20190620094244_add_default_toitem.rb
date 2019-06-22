class AddDefaultToitem < ActiveRecord::Migration[5.2]
  def dowm
    change_column :items, :status, :integer
  end
end
