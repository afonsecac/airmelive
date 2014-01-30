class AddmobileToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :mobile, :string
  end
end
