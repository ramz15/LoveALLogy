class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :title
      t.integer :user_id

      t.timestamps
    end
    
    add_index :links, [:user_id, :url, :title]
    
  end
end
