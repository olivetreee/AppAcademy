class ShortenedUrl < ActiveRecord::Base
  validates :short_url, uniqueness: true
  validates :user_id, presence: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :Visit

  has_many :visitors,
    through: :visits,
    source: :user

  def self.random_code
    shortened = SecureRandom::urlsafe_base64
    shortened = SecureRandom::urlsafe_base64 while self.exists?(short_url: shortened)

    shortened
  end

  def self.generate_short_url
    "https://a.a/#{ShortenedUrl.random_code}/"
  end

  def self.create_for_user_and_long_url!(user, long_url)
    shortened = ShortenedUrl.generate_short_url

    ShortenedUrl.create!(user_id: user.id, long_url: long_url, short_url: shortened)
  end
end
