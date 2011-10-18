class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.string :content
      
      t.timestamps
    end
  	add_index :highlights, [:user_id, :created_at]
  end
end
