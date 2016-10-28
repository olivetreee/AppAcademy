class User < ActiveRecord::Base

  validates :username, :password_digest, :session_token, presence: true
  validates :username, uniqueness: true;
  validates :password, length: {minimum: 6, allow_nil: true}

  after_initialize :ensure_session_token

  attr_reader :password

  def generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def ensure_session_token
    self.session_token ||= self.generate_session_token
  end

  def reset_session_token
    self.session_token = self.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user
    self.bcrypt_pwd.is_password?(password) ? user : nil
  end


  private
  def bcrypt_pwd
    BCrypt::Password.create(self.password_digest)
  end
end
