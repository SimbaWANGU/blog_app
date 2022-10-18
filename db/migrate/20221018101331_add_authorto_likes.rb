class AddAuthortoLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :authors, null: false, foreign_key: true
  end
end
