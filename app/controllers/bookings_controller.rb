class BookingsController < ApplicationController
  before_action :set_params, only: %i[show destroy]
  before_action :set_book, only: %i[new create]

  def index
    @bookings = policy_scope(Booking)
  end

  def show
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking # Add this line
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.book = @book
    authorize @booking
    if @booking.save!
      redirect_to book_path(Book.find(params[:book_id])), status: :see_other, notice: "Your booking has been added!!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @booking
    book_id = @booking.book_id
    @booking.destroy
    redirect_to book_bookings_path(book_id), status: :see_other, notice: "Your booking has been deleted!!"
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end

  def set_params
    @booking = Booking.find(params[:id])
  end

  def set_book
    @book = Book.find(params[:book_id])
  end
end
