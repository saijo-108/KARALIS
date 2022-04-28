class RemoveColumnFromLists < ActiveRecord::Migration[5.2]
  def change
    remove_column :lists, :searchsong_id, :string
    remove_column :lists, :preview, :string
    remove_column :lists, :song_title, :string
    remove_column :lists, :artist, :string
  end
end
