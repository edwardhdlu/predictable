class DropPredictionsTable < ActiveRecord::Migration
  def change
  	drop_table :predictions
  end
end
