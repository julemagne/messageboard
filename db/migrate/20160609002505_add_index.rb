class AddIndex < ActiveRecord::Migration
  def change
    add_index :posts, :user_id
    add_index :replies, :user_id
    add_index :replies, :post_id
  end
end
