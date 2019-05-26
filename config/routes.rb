Rails.application.routes.draw do
  #get '/', to: 'candidates#index' #引導到首頁
  root 'candidates#index'
  resources :candidates do
    #member
    member do
      patch :vote
    end
    #collection
  end

  # patch '/candidates/:id/vote', to: 'candidate#vote'
end