class RemovePartipationDateFromGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :participation_date, :date
  end
end
