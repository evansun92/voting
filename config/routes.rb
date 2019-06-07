Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/backend', as: 'rails_admin'
  devise_for :users

  #get '/', to: 'candidates#index' #引導到首頁
  root 'candidates#index'

  get '/history', to: 'users#history'
  
  resources :products, only: [:index, :show]

  resource :cart, only:[:show, :destroy] do #單數resource路徑不會有/:id 
      collection do
      put :add, path: 'add/:id' #put更新資料，post新增資料，  /cart/add/3
      get :checkout                                      #/cart/checkout
      end
    end
    # resources :carts #複數會有/:id路徑

  resources :orders, only: [:index, :show, :new, :create]

  resources :candidates do #前台應只能顯示跟投票
    #member
    member do
      patch :vote
    end
    #collection
  end

  namespace :admin do #admin 後台才能修改刪除，namespace建立一個:admin資料結構與:candidates同層
    root 'pages#index'
    resources :candidates
  end
end