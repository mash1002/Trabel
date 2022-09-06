Rails.application.routes.draw do
  get 'customers/index'
  get 'customers/edit'
  get 'customers/search'
  get 'favorites/index'
  get 'favorites/create'
  get 'favorites/destroy'
  get 'trips/index'
  get 'trips/create'
  get 'trips/edit'
  get 'trips/update'
  get 'trips/destroy'
  get 'trips/search'
  get 'homes/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
