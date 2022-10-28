class AddImageToPines < ActiveRecord::Migration[6.1]
  def change
    add_column :pines, :image, :string
  end
end
