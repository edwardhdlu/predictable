class CreatePredictions < ActiveRecord::Migration
  def change
    create_table :predictions do |t|
    	t.string :title, null: false
    	t.datetime :expire, null: false
    	t.integer :supporters, default: 0
    	t.integer :y_count, default: 0
    	t.integer :n_count, default: 0

      t.timestamps null: false
    end
  end
end