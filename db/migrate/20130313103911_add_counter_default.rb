class AddCounterDefault < ActiveRecord::Migration
  def change
    change_column :urls, :counter, :integer, :default => 0
  end
end
