class AddUserIdToPines < ActiveRecord::Migration[6.1]
  def change
    add_column :pines, :user_id, :integer
  end
end
