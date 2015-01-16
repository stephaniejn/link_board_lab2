Rails.application.routes.draw do

  root 'main#index'
  get 'about' => 'main#about', as: :about

  get 'sessions/new'
  get 'login' => 'sessions#new', as: :login
  post 'login' => 'sessions#create'

  delete 'sessions/destroy'
  get 'logout' => 'sessions#destroy' , as: :logout

  resources :users
  get 'signup' => 'users#new', as: :signup

  resources :posts
  get "posts/:id/comments" => 'posts#comments', as: :post_comments
  post "posts/:id/comments" => 'posts#create_comment'

  get 'comments/:id/comments/new' => 'comments#new_comment', as: :new_comment_comment
  post 'comments/:id/comments' => 'comments#create_comment', as: :comment_comments

  post 'comments/:id/votes'=> 'comments#create_vote', as: :comment_votes
  post 'posts/:id/votes'=> 'posts#create_vote', as: :post_vote

  # get 'users/new'

  # post 'users/create'

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
