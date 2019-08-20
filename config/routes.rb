Rails.application.routes.draw do
	resources :books,only:[:top,:index,:create,:show,:edit,:destroy,:update]
	root 'books#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
