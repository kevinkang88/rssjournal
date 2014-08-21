class CreateReaders < ActiveRecord::Migration
  def change
    create_table :readers do |t|
        t.string :name_first
        t.string :name_last
        t.string :user_name
        t.string :email
        t.string :password_hash
        t.timestamps

        # Google OAuth attributes
        t.string :provider
        t.string :uid
        t.string :name
        t.string :oauth_token
        t.datetime :oauth_expires_at
    end
  end
end
