class CreatePines < ActiveRecord::Migration[6.1]
  def change
    create_table :pines do |t|
      t.string :title
      t.string :name
      t.string :price
      t.string :place
      t.string :address
      t.text :about
      t.text :url

      t.timestamps
    end
  end
end
