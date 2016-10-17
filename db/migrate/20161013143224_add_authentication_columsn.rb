class AddAuthenticationColumsn < ActiveRecord::Migration
  def change
  	add_column :authentications, :provider, :string;
  	add_column :authentications, :uid, :string;
  	add_column :authentications, :token, :string;
  end
end
