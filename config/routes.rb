Rails.application.routes.draw do
  resources :teachers
  get '/import', to: 'teachers#import'
  get '/truncate', to: 'teachers#truncate'

end
