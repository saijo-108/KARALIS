class AddColumnLists2 < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :searchsong_id, :string
  end
end
