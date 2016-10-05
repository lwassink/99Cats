class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }

  validate :no_overlaping_aproved_requests

  def no_overlaping_aproved_requests
    if overlapping_approved_requests > 0 && self.status == "APPROVED"
      errors["Cat"] << "already checked out."
    end
  end

  belongs_to :cat

  def overlapping_requests
    data = CatRentalRequest.where(cat_id: self.cat_id)
      .where("start_date BETWEEN :start_date AND :end_date
        OR end_date BETWEEN :start_date AND :end_date
        OR :start_date BETWEEN start_date AND end_date",
        start_date: self.start_date, end_date: self.end_date)

    if self.id
      data.where("cat_rental_requests.id != ?", self.id)
    else
      data
    end
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: "APPROVED").count
  end

  def deny!
    self.status = "DENIED"
    self.save
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: "PENDING")
  end

  def approve!
    ActiveRecord::Base.transaction do
      self.status = "APPROVED" unless overlapping_approved_requests > 0
      self.save
      self.overlapping_pending_requests.destroy_all
    end
  end
end
