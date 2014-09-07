class AddDeadlineToItems < ActiveRecord::Migration
  def change
    add_column :items, :deadline, :datetime
    add_column :items, :missed, :boolean
  end
end
