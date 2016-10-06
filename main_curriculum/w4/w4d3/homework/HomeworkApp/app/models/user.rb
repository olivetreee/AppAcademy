# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password, allow_nil: true, length: { minimum: 6 }

  validate :pwd_cant_be_blank

  def pwd_cant_be_blank
    return if password != ""
    errors[:password] << "can't be blank"
  end



  def self.find_by_credentials(username, pwd)
    user = User.find_by(username: username)
    return user if user && bcrypt_pwd(pwd).is_password?(:password_digest)
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    new_token = User.generate_session_token
    self.update(session_token: new_token)
    new_token
  end

  def ensure_session_token
    reset_session_token! if self.session_token.nil?
  end

  private

  def bcrypt_pwd(pwd)
    BCrypt::Password.create(pwd)
  end

  def to_bcp(str)
    BCrypt::Password.new(str)
  end


end
