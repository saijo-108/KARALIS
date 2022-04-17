class AddColumnLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :preview, :string
    add_column :lists, :song_title, :string
    add_column :lists, :artist, :string
    add_column :lists, :song_time, :integer
    add_column :lists, :status, :integer
    add_column :lists, :user_id, :integer
    add_column :lists, :group_id, :integer
  end
end
