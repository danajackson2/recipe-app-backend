class RemoveAuthorFromRecipes < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipes, :author, :string
  end
end
