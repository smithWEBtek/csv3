Rails.application.routes.draw do
  resources :scrapers
  resources :teachers
  get '/import', to: 'teachers#import'
  get '/truncate', to: 'teachers#truncate'

end
