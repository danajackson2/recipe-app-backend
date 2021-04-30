class AddImgToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :img, :string
  end
end
