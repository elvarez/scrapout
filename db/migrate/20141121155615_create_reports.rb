class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.integer :active_days
      t.integer :idle_days
      t.integer :prod_ratio
      t.timestamps 
    end
  end
end
