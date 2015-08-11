class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]
  load_and_authorize_resource

  before_filter :set_book, only: [:edit, :update, :destroy]

  def index
    @books = Book.where(status: [0, 1, 2]).order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      flash[:success] = 'Книга успешно создана.'
      redirect_to books_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @book.update_attributes(book_params)
      flash[:success] = 'Книга успешно обновлена.'
      redirect_to books_path
    else
      flash[:error] = 'Произошла ошибка.'
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    flash[:success] = 'Книга успешно удалена.'
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:image, :name, :author, :publisher, :year, :pages, :extension, :size, :isbn, :quality,
                                 :series, :language, :description, :link1, :link2, :link3, :link4, :link5, :user_id)
  end

end