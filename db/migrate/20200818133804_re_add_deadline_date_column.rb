class ReAddDeadlineDateColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :deadline_date, :string
  end
end
