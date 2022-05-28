class RemoveRoleFromGroup < ActiveRecord::Migration[6.1]
  def change
    remove_column :groups, :role, :integer
  end
end
