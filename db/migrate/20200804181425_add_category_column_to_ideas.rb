class AddCategoryColumnToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :category, :string
  end
end
