class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_password, :update_password]
  before_action :set_user, only: [:followings, :followers]

  def index
    @user = current_user
    @schedule = Schedule.new
    @users = User.all
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

  def followings
    @users = @user.followings
  end

  # def followers
  #   @users = @user.followers
  # end


  private

  def set_user
    # @user = current_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :profile_image, :password)
  end
end
