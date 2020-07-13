class AddVilleToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ville, :string
  end
end
