class AddTokenToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :authentication_token, :string
  end
end
