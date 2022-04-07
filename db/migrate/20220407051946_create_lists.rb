class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :name
      t.date :registration_date

      t.timestamps
    end
  end
end
