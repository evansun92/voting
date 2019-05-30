class CandidatePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

#各action的使用權限設定，但這裡的def是方法（不是在controller)
  def index? 
    user && user.admin? #在user.rb def admin?
    # false
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
