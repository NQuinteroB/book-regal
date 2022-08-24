class PagesController < ApplicationController
  def home
    @books1 = Book.first(3)
    @books2 = Book.last(3)
  end
end
