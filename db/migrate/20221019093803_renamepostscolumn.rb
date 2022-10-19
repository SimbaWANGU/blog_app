class Renamepostscolumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :authors_id, :author_id
    rename_column :comments, :authors_id, :author_id
    rename_column :comments, :posts_id, :post_id
    rename_column :likes, :authors_id, :author_id
    rename_column :likes, :posts_id, :post_id
  end
end
