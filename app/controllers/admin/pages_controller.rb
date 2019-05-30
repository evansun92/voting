class Admin::PagesController < Admin::BaseController
  #改繼承 Admin::BaseController
  
  def index
    authorize Candidate #驗證candidate_policy.rb <-自行改檔名
  end
end
