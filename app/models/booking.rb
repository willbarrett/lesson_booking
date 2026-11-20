class Booking < ApplicationRecord
  STATUSES = %w[confirmed canceled].freeze

  belongs_to :teacher
  belongs_to :student

  validates :starts_at, presence: true
  validates :starts_at, uniqueness: { scope: :teacher_id }
  validates :duration_minutes, inclusion: { in: [30, 45, 60] }
  validates :status, inclusion: { in: STATUSES }

  scope :confirmed, -> { where(status: "confirmed") }

  def ends_at
    starts_at + duration_minutes.minutes
  end
end
