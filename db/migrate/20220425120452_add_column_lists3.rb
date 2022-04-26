class AddColumnLists3 < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :searchsong_id, :string
    add_column :lists, :preview, :string
    add_column :lists, :song_title, :string
    add_column :lists, :artist, :string
  end
end
