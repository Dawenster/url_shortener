class AddUserIdToUrls < ActiveRecord::Migration
  def change
    add_column :urls, :user_id, :integer, :default => nil
  end
end
