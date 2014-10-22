class AddRemindToItems < ActiveRecord::Migration
  def change
    add_column :items, :remind, :boolean
  end
end
