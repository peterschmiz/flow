Rails.application.routes.draw do

	root 'static_pages#home'

	get 'home' => 'static_pages#home'

	get 'login' => 'sessions#new'
	post 'login' => 'sessions#create'
	get 'logout' => 'sessions#destroy'
	delete 'logout' => 'sessions#destroy'

	get 'adduser' => 'users#new'
	get 'edituser/:id' => 'users#edit'

	get 'addproject' => 'projects#new'
	get 'editproject/:id' => 'projects#edit'

	get 'assign/:id', to: 'project_assignments#new', as: 'assign'
	delete 'project_assignments/:id', to: 'project_assignments#destroy'

	get 'adddivision' => 'divisions#new'
	get 'editdivision' => 'divisions#edit'

	get 'bookings' => 'bookings#index'
	post 'bookings/setdate' => 'bookings#setdate'
	post 'bookings/update-bookings' => 'bookings#update_bookings'

	get 'search' => 'search#index'
	post 'search' => 'search#index'

	resources :users
	resources :projects
	resources :project_assignments
	resources :divisions

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
