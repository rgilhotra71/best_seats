class Movie < ApplicationRecord
  # Associations
  has_many :seats, dependent: :destroy

  # Valdations
  validates :title, :summary, :year, :genre, :rows, :columns, presence: true

  # Callbacks
  after_create :create_seats
  ROWS = ("a".."z").to_a

  private

  def create_seats
    rows.times do |i|
    	row = ROWS[i%26]
      seats_data = columns.times.map do |n|
        {number: "#{row}#{n+1}", row: row, column: n+1, status: 0}
      end
    	seats.create(seats_data)
    end
  end
end
