class CreateDreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :dreams, [:user_id, :updated_at]
  end
end
