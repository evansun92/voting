Rails.application.routes.draw do
  devise_for :users

  #get '/', to: 'candidates#index' #引導到首頁
  root 'candidates#index'

  get '/history', to: 'users#history'

  resources :candidates do #前台應只能顯示跟投票
    #member
    member do
      patch :vote
    end
    #collection
  end

  namespace :admin do #admin 後台才能修改刪除
    root 'pages#index'
    resources :candidates
  end
end