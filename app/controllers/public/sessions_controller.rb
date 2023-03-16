# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # before_action :user_state, only: [:create]

  # ログイン後に遷移するパス
  def after_sign_in_path_for(resource)
    my_page_path
  end

  # ログアウト後に遷移するパス
  def after_sign_out_path_for(resource)
    root_path
  end

  # protected
end
