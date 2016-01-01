class AddNameToUsersAndHideToPredictions < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :predictions, :hide, :boolean, default: false
  end
end
