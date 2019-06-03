class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "權限不足！"
    redirect_to(request.referrer || root_path) #request.referrer為來源位置(來此頁面之前的位置)
  end

  #4~11行設定當權限未認證時不至於噴錯，用顯示alert的方式
  #從 pundit 複製此段rescue用法，規定放在application_controller
end
