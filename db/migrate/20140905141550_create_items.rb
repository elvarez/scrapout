class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.integer :list_id
      t.string :description

      t.timestamps
    end
    add_index :items, :user_id
  end
end
