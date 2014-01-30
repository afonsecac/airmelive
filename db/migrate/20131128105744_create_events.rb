class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :eventname
			t.string :category
			t.datetime :registrationopen
			t.datetime :registrationclose
			t.datetime :auditionopen
			t.datetime :auditionclose
			t.datetime :eventopen
			t.datetime :eventclose
			t.string :description
			t.string :rules
			t.timestamps
    end
  end
end
