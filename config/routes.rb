Rails.application.routes.draw do
  root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/'

  namespace :app_proxy do
    root action: 'index'
    # simple routes without a specified controller will go to AppProxyController
    
    # more complex routes will go to controllers in the AppProxy namespace
    # 	resources :reviews
    # GET /app_proxy/reviews will now be routed to
    # AppProxy::ReviewsController#index, for example
    get '/app_proxy/account'
  end
  get '/get_price_rule', to: 'api#get_price_rule'
  post '/multipass', to: 'api#multipass'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
