class CandidatePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

#在candidate_controller的各action的使用權限設定，但這裡的def是方法（不是在controller)
  def index? 
    user && user.admin?
    #要在此使用.admin?方法，則需在user.rb 定義方法 def admin?
    # false #用預設false的話，代表所有user都沒有權限
  end

  # def show?
  #   false
  # end

  def create?
    user && user.admin? 
  end

  def new?
    user && user.admin? 
  end

  # def update?
  #   false
  # end

  def edit?
    user && user.admin? 
  end

  def destroy?
    user && user.admin? 
  end

  # class Scope
  #   attr_reader :user, :scope

  #   def initialize(user, scope)
  #     @user = user
  #     @scope = scope
  #   end

  #   def resolve
  #     scope.all
  #   end
  # end
end
