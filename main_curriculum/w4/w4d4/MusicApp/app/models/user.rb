# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :email, :password_digest, :session_token, presence: true
  validates :email, :session_token, uniqueness: true
  validates :password, length: {minimum: 8, allow_nil: true}

  after_initialize :ensure_session_token

  has_many :notes

  attr_reader :password

  def self.find_by_credentials(email,pwd)
    wanted_user = User.find_by(email: email)
    return wanted_user if wanted_user &&
    wanted_user.bcrypt_password.is_password?(pwd)
    nil
  end

  def password=(pwd)
    @password = pwd
    self.password_digest = BCrypt::Password.create(pwd)
  end

  def generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

  def reset_session_token!
    self.session_token = generate_session_token
  end

  def bcrypt_password
    BCrypt::Password.new(self.password_digest)
  end

end
