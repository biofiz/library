class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :set_comment, only: [:edit, :update, :destroy]
  load_and_authorize_resource

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = 'Комментарий успешно добавлен.'
    else
      flash[:error] = 'Произошла ошибка'
    end
    redirect_to :back
  end

  def edit
  end

  def update
    if @comment.update_attributes(comment_params)
      flash[:success] = 'Комментарий успешно обновлен.'
      redirect_to :controller => 'books', :action => 'show', :id => @comment.book_id
    else
      flash[:error] = 'Произошла ошибка'
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = 'Комментарий успешно удален.'
    redirect_to :back
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:book_id, :content)
  end
end