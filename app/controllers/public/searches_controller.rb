class Public::SearchesController < ApplicationController
  def index
    @keyword = params[:word] # 検索キーワードを取得
    if @keyword.present?
      @users = User.where(member_id: @keyword) # 完全一致検索を行う
    else
      @users = [] # 検索キーワードがない場合は空の配列を返す
    end
  end
end
