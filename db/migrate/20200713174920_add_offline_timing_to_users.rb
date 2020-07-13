class AddOfflineTimingToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :offline_timing, :datetime
  end
end
