class PagesController < ApplicationController
  def home
    @books1 = Book.where(user_id: current_user)
    @books2 = Book.where.not(user_id: current_user).first(3)
  end
end
