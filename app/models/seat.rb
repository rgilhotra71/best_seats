class Seat < ApplicationRecord
  enum status: [ :available, :booked ]

  # Associations
  belongs_to :movie

  # Valdations
  validates :number, :row, :column, :status, presence: true

  scope :available, -> { where(status: 0) }
end
