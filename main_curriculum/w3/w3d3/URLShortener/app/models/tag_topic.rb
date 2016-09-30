class TagTopic < ActiveRecord::Base
  validates :topic, presence: true

  has_many :taggings,
    primary_key: :id,
    foreign_key: :topic_id,
    class_name: :Tagging

  has_many :urls,
    through: :taggings,
    source: :url

  def most_popular
    most_visited_url = nil
    num_visits = 0

    urls.each do |url|
      unique_visits = url.num_uniques

      if unique_visits > num_visits
        num_visits = unique_visits
        most_visited_url = url
      end
    end

    most_visited_url
  end
end
