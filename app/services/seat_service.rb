class SeatService
	
	attr_reader :movie, :req_seats, :seat_found, :best_seats
	
	def initialize(movie, seats)
		@movie = movie
    avl_seats = @movie.seats.available.select(:number).pluck(:number)
    @available_seats = Hash[avl_seats.collect { |seat| [seat, ""] } ]
		@req_seats = seats.to_i
		@seat_found = false
		@best_seats = []
	end

  def best_seat
    counter = 0
    until @seat_found
    	seat_options = get_seats(counter)
    	check_availability(seat_options)
      counter +=1
    end
    @best_seats
  end

  def get_seats(counter)
  	mid = (movie.columns/2.0).ceil
  	seats_arr = []
  	counter.downto(0).with_index do |n, i|
      break if i >= movie.rows
  		next if (mid+n) > movie.columns 
      if req_seats == 1
	      seats_arr << ["#{Movie::ROWS[i]}#{mid-n}"]
	      seats_arr << ["#{Movie::ROWS[i]}#{mid+n}"] if n > 0
      else
        left = right = req_seats/2
        right -= 1 if req_seats.even?
        l_range = (mid-n-left)..(mid-n+right)
        seats_arr << l_range.map {|n| "#{Movie::ROWS[i]}#{n}" }
        r_range = (mid+n-left)..(mid+n+right)
        seats_arr << r_range.map {|n| "#{Movie::ROWS[i]}#{n}" } if n > 0
      end
  	end
    seats_arr
  end

  def check_availability(seat_options)
  	seat_options.each do |options|
      seats = options.select { |seat| @available_seats[seat] }
      if seats.size == req_seats
        @best_seats = options
  			@seat_found = true
  			break
      end
  	end
  end
end
