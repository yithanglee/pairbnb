class AddForeignKeyToUserFromAuthentication < ActiveRecord::Migration
  def change
  	# add_foreign_key :authentications, :users
  	add_column :authentications, :user_id, :integer
  end
end
