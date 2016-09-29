class ShortenedUrl < ActiveRecord::Base
  validates :short_url, uniqueness: true
  validates :user_id, presence: true
  validate :long_url_not_too_long, :not_too_many_submissions

  def long_url_not_too_long
    if long_url.length > 1024
      errors[:input_url_length] << "can't be greater than 1024 characters!"
    end
  end

  def not_too_many_submissions
    if num_submissions >= 5
      errors[:max_submissions_per_minute] << "exceeded limit of 5!"
    end
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :Visit

  has_many :visitors,
    -> { distinct }, ## sugar for Proc.new { distinct }
    through: :visits,
    source: :visitor

  has_many :taggings,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Tagging

  has_many :tag_topics,
    through: :taggings,
    source: :tag_topic

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

  def num_clicks
    visits.select(:visitor_id).count
  end

  def num_uniques
    visitors.count
  end

  def num_recent_uniques
    recent_visits = Visit.where(["short_url_id = :id AND created_at > :t", {id: self.id, t: 10.minutes.ago}])

    recent_visits.select(:visitor_id).distinct.count
  end

  def num_submissions
    recent_submissions = ShortenedUrl.where(["user_id = :user_id AND created_at > :t", {user_id: self.user_id, t: 1.minutes.ago}])

    recent_submissions.count
  end
end
