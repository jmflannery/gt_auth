class CreateGtAuthAdministrators < ActiveRecord::Migration
  def change
    create_table :gt_auth_administrators do |t|
      t.string :name
      t.string :password_digest

      t.timestamps
    end
  end
end
