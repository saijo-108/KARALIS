class RemoveStatusFromLists < ActiveRecord::Migration[5.2]
  def change
    remove_column :lists, :status, :integer
  end
end
