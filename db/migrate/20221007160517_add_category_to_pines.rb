class AddCategoryToPines < ActiveRecord::Migration[6.1]
  def change
    add_column :pines, :content, :string
    add_column :pines, :category, :string
  end
end
