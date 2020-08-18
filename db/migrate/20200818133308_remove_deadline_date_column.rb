class RemoveDeadlineDateColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :ideas, :deadline_date, :datetime
  end
end
