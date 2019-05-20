class CandidatesController < ApplicationController
    def new
        @candidate = Candidate.new
        render file: '../views/candidates/new.html.erb'
    end

    def index
        render file: '../views/candidates/index.html.erb'
    end

    def create #不需要成功畫面
        @candidate = Candidate.new(candidate_params)
        
        # @candidate.name = params[:candidate][:name] #不需.save 因有明確指定給定目標
        # @candidate.age = params[:candidate][:age] #不需.save 因有明確指定給定目標

        if @candidate.save
            flash[:notice] = '新增成功' #flash只會輸出一次,重新整理就消失
            redirect_to '/'
        else
            flash[:notice] = '新增失敗' #將 <%=flash%> 移到公版layput 才能在兩個頁面都顯示
            render :new #新增失敗,保留已輸入的欄位,借new.html.erb畫面來使用,而new.html.erb內容是從@candidate = Candidate.new(candidate_params)來的
        end
    end

    private
    def candidate_params
        params.require(:candidate).permit(:name, :age, :party, :platform) #明確指定此四欄位才能.save
    end
end
