ContactUs::Engine.routes.draw do
  resources :contacts, :only => [:new, :create]
  root 'contacts#new'
end
