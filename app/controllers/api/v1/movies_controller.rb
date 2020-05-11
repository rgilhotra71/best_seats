class Api::V1::MoviesController < ApplicationController
  rescue_from Exception, :with => :api_error
  before_action :set_movie, only: [:show, :best_seat]

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
    render json: @movies
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    render json: @movie
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie
    else
      render json: @movie.errors
    end
  end

  def best_seat
    service = SeatService.new(@movie, params[:seats])
    seats = service.best_seat
    @movie.seats.where(number: seats).update_all(status: 1)
    render json: {seats: seats.join(", ")}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :summary, :year, :genre, :imdb_link, :rows, :columns)
    end

    def api_error(exception)
      render json: {error: exception }
    end
end
