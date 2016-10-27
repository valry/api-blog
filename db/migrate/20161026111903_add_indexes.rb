class AddIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :api_keys, :key
    add_index :posts, :author
    add_index :comments, :author
  end
end
