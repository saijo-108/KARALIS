class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.text :description
      t.date :participation_date
      t.integer :role, default: 1, null: false
      t.timestamps
    end
  end
end
