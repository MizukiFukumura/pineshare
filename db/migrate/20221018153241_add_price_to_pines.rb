class AddPriceToPines < ActiveRecord::Migration[6.1]
  def change
    add_column :pines, :price, :string
  end
end
