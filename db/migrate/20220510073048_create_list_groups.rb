class CreateListGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :list_groups do |t|
      t.references :list, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
