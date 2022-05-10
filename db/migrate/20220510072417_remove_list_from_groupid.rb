class RemoveListFromGroupid < ActiveRecord::Migration[5.2]
  def change
    remove_column  :lists, :group_id
  end
end
