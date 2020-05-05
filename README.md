# README
# best_seats
App to find best available seat.

Note: For making testing easy I have made it like: booking the seats found, when we check for best available seat. So that it will return the next best available seats if we check for that movie again.


* Ruby version

2.5.1


* Configuration

Run 'bundle install' in the app directory and follow the instructions untill successfully completed. Run 'rails c' to verify if setup is complete and successfull. 


* Database creation
1. Set your system credentials in 'database.yml' localy.

2. Run 'rake db:create' and then 'rake db:migrate' to setup the database.

3. Run 'rake db:seed' to add some movies to database.


NOTE: If you are not able to setup the whole application and manage to run 'rails c', you can still test the functionality. What you can do is:

1. Run 'service = SeatService.new(Movie.last, 2)' in rails console, where  Movie.last is the movie object and 2 is the number of seats requied.

2. Then run 'service.best_seat'. It will return the best seats available for that movie e.g. ["a11", "a12"]



* Developer information

There is a service 'SeatService' which does the hardwork of finding the bst available seat for movie. It takes tow arguments i.e. movie object and number of seats required. This is how the algorithm works:

1. It checks the rows and columns of seats and find out the best seat possible for that movie. It checks for single seat or group of seats depending on the required numer of seats.

2. It checks if those seat/seat/seats are available it will return the seat/seats. 

3. If even one/all of those seats are not available it will skip and check for the secong best seat/group of seats available.

4. It checks if those seat/seats are available it will return the seat/seats. 

5. If even one/all of those seats are not available it will skip and check for the third best seat/group of seats available. And the process goes on until it find the best available seat.
* ...
