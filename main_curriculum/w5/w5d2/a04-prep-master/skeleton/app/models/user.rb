# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  has_many :links
  has_many :comments

  attr_reader :password

  after_initialize :ensure_token

  def self.find_by_credentials(user,pwd)
    wanted_user = User.find_by(username: user)
    return nil unless wanted_user
    wanted_user.bcrypt_pwd.is_password?(pwd) ? wanted_user : nil

  end

  def password=(pwd)
    @password = pwd
    self.password_digest = BCrypt::Password.create(pwd)
  end

  def generate_token
    SecureRandom.urlsafe_base64(16)
  end

  def ensure_token
    self.session_token ||= generate_token
  end

  def reset_token!
    self.session_token = generate_token
    self.save
  end

  def bcrypt_pwd
    BCrypt::Password.new(self.password_digest)
  end

end
