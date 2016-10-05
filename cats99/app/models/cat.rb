class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, :sex, presence: true

  COLORS =  %w(white black brown beige spotted)

  validates :color, inclusion: { in: COLORS, message: "%{value} is not a valid color"}
  validates :sex, inclusion: { in: %w(M F), message: "%{value} is not a valid sex"}

  has_many :cat_rental_requests, dependent: :destroy


  def age
    now = Time.now.utc.to_date
    now.year - :birth_date.year - (:birth_date.to_date.change(:year => now.year) > now ? 1 : 0)
  end
end
