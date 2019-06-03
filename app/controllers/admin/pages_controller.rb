class Admin::PagesController < Admin::BaseController
  #改繼承 Admin::BaseController
  
  def index
    authorize Candidate #在後台首頁驗證使用者的role是否為'admin'，
    #authorize會去找xxx_policy.rb檔，故關聯到 candidate_policy.rb <-自行改檔名，原預設為application_policy,rb
  end
end
