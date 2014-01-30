class AddgplusToUsers < ActiveRecord::Migration
  def change

  	add_column :users, :gplus, :integer
  	add_column :users, :name, :string

  end
end
