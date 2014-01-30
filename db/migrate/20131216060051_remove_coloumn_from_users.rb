class RemoveColoumnFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :gplus, :integer
  	add_column :users, :gplus, :string
  end
end
