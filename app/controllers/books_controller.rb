class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]
  load_and_authorize_resource

  before_filter :set_book, only: [:edit, :update, :destroy]

  def index
    @books = Book.all.order(created_at: :desc).page(params[:page]).per(10)
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
    params.require(:book).permit(:name, :author, :publisher, :year, :language, :extension, :size, :pages, :user_id)
  end

end