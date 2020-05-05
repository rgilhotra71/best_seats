class Seat < ApplicationRecord
  enum status: [ :available, :booked ]
  belongs_to :movie
end
