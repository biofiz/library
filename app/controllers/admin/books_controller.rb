class Admin::BooksController < Admin::ApplicationController
  def index
    @books = Book.all
  end
end
