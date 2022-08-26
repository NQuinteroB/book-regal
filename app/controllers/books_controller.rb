class BooksController < ApplicationController
  before_action :set_params, only: %i[show edit update destroy]

  def index
    @books = policy_scope(Book)
      if params[:query].present?
        @books = Book.search_by_title_and_category(params[:query])
      else
        @books = Book.all
      end
    @markers = @books.geocoded.map do |book|
      {
        lat: book.latitude,
        lng: book.longitude
      }
    end
  end


  def show
    @reviews = Review.where(book_id: @book)
    authorize @book
    # Add this line
  end

  def new
    @book = Book.new
    authorize @book # Add this line
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    authorize @book
    if @book.save!
      redirect_to book_path(@book), notice: "Your book has been added!!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @book
  end

  def update
    authorize @book
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "Your book has been edited!!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @book
    @book.destroy
    redirect_to books_path, notice: "Your book has been deleted!!"
  end

  private

  def book_params
    params.require(:book).permit(:title, :book_category, :language, :photo)
  end

  def set_params
    @book = Book.find(params[:id])
  end
end
