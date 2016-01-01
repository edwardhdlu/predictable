class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    	t.integer :user_id
    	t.integer :prediction_id
    	t.boolean :agree

      t.timestamps null: false
    end
  end
end
