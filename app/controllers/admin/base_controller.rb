class Admin::BaseController < ApplicationController
  before_action :authenticate_user! #需登入會員才能進入後台，故將後台所有的controller都改繼承至 Admin::BaseController ，即可設定 before_action :authenticate_user! 一次就好，此base_controller.rb是自行手動新增

  private
  def authorize_user!
    # case controller_name.to_s
    # when 'pages'
    #   case current_user.role
    #   when 'admin'
    #   when ''

    redirect_to root_path, alert: '權限不足！' if current_user.role != 'admin'
  end
end