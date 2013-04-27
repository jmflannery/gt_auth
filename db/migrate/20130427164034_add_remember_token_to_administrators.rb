class AddRememberTokenToAdministrators < ActiveRecord::Migration
  def change
    add_column :gt_auth_administrators, :remember_token, :string
    add_index :gt_auth_administrators, :remember_token
  end
end
