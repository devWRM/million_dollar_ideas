class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.string :title
      t.string :inspiration
      t.string :summary
      t.datetime :date_created, default: -> { 'CURRENT_TIMESTAMP' }
  # Above input is MANDATORY
      t.string :timeline_plan
      t.datetime :deadline_date
      t.string :action_steps_accomplished
      t.string :resources
      t.integer :total_budgeted_dollars
      t.integer :total_spent_dollars
      t.integer :remaining_budgeted_dollars
      t.boolean :within_budget
    end
  end
end
