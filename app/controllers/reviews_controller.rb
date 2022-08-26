class ReviewsController < ApplicationController
 before_action :set_params, only: %i[show destroy]
  before_action :set_book, only: %i[new create]

  def index
    @reviews = policy_scope(Review)
  end

  def show
    authorize @review
  end

  def new
    @review = Review.new
    authorize @review # Add this line
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.book = @book
    authorize @review
    if @review.save!
      redirect_to book_path(@book), status: :see_other, notice: "Your review has been added!!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @review
    book_id = @review.book_id
    @review.destroy
    redirect_to book_path(Book.find(params[:book_id])), status: :see_other, notice: "Your review has been deleted!!"
  end

  private

  def review_params
    params.require(:review).permit(:content, :anonimously)
  end

  def set_params
    @review = Review.find(params[:id])
  end

  def set_book
    @book = Book.find(params[:book_id])
  end
end
