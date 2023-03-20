class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    if params[:query].present?
      @users = User.where(membership_id: params[:query])
    else
      flash.now[:error] = "ユーザーが見つかりませんでした。"
    end
  end
end
