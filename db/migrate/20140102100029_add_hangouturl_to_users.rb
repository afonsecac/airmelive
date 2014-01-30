class AddHangouturlToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :hangouturl, :string
  end
end
