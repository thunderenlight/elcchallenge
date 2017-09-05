Rails.application.routes.draw do
	resources :standards do 
		collection { post :create }
		member { get :save }
	end
	root to: "standards#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
