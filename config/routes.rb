Rails.application.routes.draw do
  devise_for :users, skip: [:password, :registration]
  mount Ckeditor::Engine => '/ckeditor'
  root 'static_pages#home'
  match '/about',        to: 'static_pages#about',        via: 'get'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :issues, only: :show
  resources :parties, only: :show do
    match 'issues', to: 'parties#issues', via: 'get', as: 'issues'
    match 'issues/:id', to: 'parties#issue', via: 'get', as: 'issue'
    match 'issues/:id/bills', to: 'parties#bills', via: 'get', as: 'issue_bills'
    match 'issues/:id/interpellations', to: 'parties#interpellations', via: 'get', as: 'issue_interpellations'
    match 'issues/:id/votes', to: 'parties#votes', via: 'get', as: 'issue_votes'
  end
  resources :candidates, only: :show do
    match 'issues', to: 'candidates#issues', via: 'get', as: 'issues'
    match 'issues/:id', to: 'candidates#issue', via: 'get', as: 'issue'
    match 'issues/:id/bills', to: 'candidates#bills', via: 'get', as: 'issue_bills'
    match 'issues/:id/interpellations', to: 'candidates#interpellations', via: 'get', as: 'issue_interpellations'
    match 'issues/:id/votes', to: 'candidates#votes', via: 'get', as: 'issue_votes'
  end
  resources :bills, only: :show
  resources :interpellations, only: :show
  resources :votes, only: :show
  match '/emails', to: 'emails#create',  via: 'post'
  match '/emails', to: 'emails#destroy', via: 'delete'
  namespace :admin do
    root 'static_pages#home'
    resources :issues do
      resources :slides
    end
    resources :parties
    resources :candidates
    resources :party_standpoints
    resources :candidate_standpoints
    resources :bills
    resources :interpellations
    resources :votes
    resources :questions
    resources :promises
    resources :emails, only: :index
    match 'emails/export', to: 'emails#export', via: 'get', as: 'emails_export'
    match 'slides/sort',  to: 'slides#sort',  via: 'put'
    # resources :slides, except: [:show] do
    #   
    # end
  end
  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
