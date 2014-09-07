class AddDefaults < ActiveRecord::Migration
  def change
    change_column_default(:items, :missed, false)
    change_column_default(:items, :done, false)
  end
end
