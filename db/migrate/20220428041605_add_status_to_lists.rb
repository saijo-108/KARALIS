class AddStatusToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :status, :integer, null: false, default: 0
  end
end
