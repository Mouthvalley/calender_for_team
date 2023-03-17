class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to my_page_path, notice: 'ユーザー情報を更新しました'
    else
      render :edit
    end
  end

  def unsubscribe
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to root_path, notice: '退会が完了しました。'
    else
      redirect_to root_path, alert: '退会に失敗しました。'
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :profile_image, :password, :password_confirmation)
  end
end
