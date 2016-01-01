class CreateSupports < ActiveRecord::Migration
  def change
    create_table :supports do |t|
    	t.integer :user_id
    	t.integer :prediction_id

      t.timestamps null: false
    end
  end
end
