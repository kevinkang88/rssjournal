require 'bcrypt'

class Reader < ActiveRecord::Base
  attr_accessible :email, :name_first, :name_last, :user_name, :password

  has_many :stories_readers
  has_many :stories, through: :stories_readers
  has_many :thoughts

  include BCrypt
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password 
  end

  # needed for Google OAuth
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
