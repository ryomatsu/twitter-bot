class AddColumnsToUser < ActiveRecord::Migration
  def change
      add_column :users, :access_token, :string, default: ""
      add_column :users, :access_token_secret, :string, default: ""
  end
end
