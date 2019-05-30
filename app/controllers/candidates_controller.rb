class CandidatesController < ApplicationController
  before_action :find_candidate, only: [:show, :update, :edit, :destroy, :vote]
  before_action :authenticate_user!, except: [:index, :show] # before_action :authenticate_user! 是devise內建的篩選helper
  
  def index
    @candidates = Candidate.all.order(:vote).reverse_order.page(params[:page]).per(3) #kaminari
    # render file: '../views/candidates/index.html.erb'
  end

  def new
    @candidate = Candidate.new
    authorize @candidate
    # render file: '../views/candidates/new.html.erb'
  end

  def create #不需要成功畫面
    @candidate = Candidate.new(candidate_params)
    authorize @candidate
      
    # @candidate.name = params[:candidate][:name] #不需.save 因有明確指定給定目標
    # @candidate.age = params[:candidate][:age] #不需.save 因有明確指定給定目標

    if @candidate.save
      # flash[:notice] = '新增成功' #flash只會輸出一次,重新整理就消失
      # redirect_to '/'
      redirect_to root_path, notice: '新增成功' #合併上面兩行的寫法
    else
      render :new #新增失敗,保留已輸入的欄位,借new.html.erb畫面來使用,而new.html.erb內容是從@candidate = Candidate.new(candidate_params)來的
    end
  end

  def show
    #before_action
  end

  def edit
    #before_action
    # redirect_to root_path, alert: '需要登入' unless user_signed_in?
    # 使用devise內建的before_action :authenticate_user!

    authorize @candidate
  end

  def update
    #before_action
    if @candidate.update(candidate_params)
      flash[:notice] = '更新成功'
      redirect_to root_path
    else
      render :edit
    end
  end

  def vote
    #before_action

    #第1種 從候選人的角度
    # @candidate.votes.create(ip_adress: request.remote_ip) #會得到一個陣列 [vote, vote, vote]
    #request.remote_ip 查rails ip address得到的方法
    
    #第2種 從票的角度
    #Vote.create(candidate: @candidate, ip_adress: request.remote_ip)
    #若沒設定belongs_to則會錯誤，應為 candidate_id: @candidate.id

    #第3種
    # v = Vote.new
    # v.candidate = @candidate
    # v.save

    #在 model 加 counter cache 解決n+1
    
    #從登入者角度來新增
    current_user.votes.create(ip_adress: request.remote_ip, candidate: @candidate)
    #從候選人角度來新增
    # @candidate.votes.create(ip_adress: request.remote_ip, user: current_user)

    flash[:notice] = '投票完成'
    redirect_to root_path
  end

  def destroy
    #before_action
    authorize @candidate

    @candidate.destroy if @candidate
    flash[:notice] = '資料已刪除'
    redirect_to root_path
  end

  private
  def candidate_params
    params.require(:candidate).permit(:name, :age, :party, :platform, :avatar) #明確指定此四欄位才能.save
  end

  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
  end
end
