class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]


  def index
    @users = User.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def destroy
    @user.destroy
    flash[:success] = 'Пользователь успешно удален.'
    redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # def users_params
  #   params.require(:user).permit(:name, :author, :publisher, :year, :language, :extension, :size, :pages)
  # end
end