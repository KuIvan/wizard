class WorkExperience < ApplicationRecord

  belongs_to :user, optional: false
  belongs_to :country, optional: true

  validates :end_at,
            presence: true,
            unless: :active

  validates :start_at,
            :organization_name,
            presence: true

  validate :end_at_date, unless: :active

  before_save :determine_end_at

  scope :persisted, -> { where.not(id: nil) }

  private
  def determine_end_at
    self.end_at = nil if active
  end

  def end_at_date
    if start_at > end_at
      errors.add(:start_at, "cannot be bigger than end date")
      errors.add(:end_at, "cannot be smaller than start date")
    end
  end

end
