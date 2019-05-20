Rails.application.routes.draw do
  #get '/', to: 'candidates#index' #引導到首頁
  root 'candidates#index'
  resources :candidates
end