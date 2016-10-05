class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED), message: "%{value} is not a valid status" }

  validate :overlapping_approved_requests

  belongs_to :cat

  def approved_requests
    CatRentalRequest.all.where(status: "APPROVED", cat_id: self.cat_id)
  end

  def overlapping_approved_requests
    overlap_requests = approved_requests.any? do |req|
      (self.start_date >= req.start_date && self.start_date <= req.end_date) ||
      (self.end_date >= req.start_date && self.end_date <= req.end_date)
    end
    if overlap_requests
      errors[:cat] << "is already booked for those dates"
    end
  end
end
