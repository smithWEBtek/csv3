Rails.application.routes.draw do

  resources :scrapers, :teachers, :companies
  get '/import_new_companies', to: 'tools#import'
  get '/trunc_reset', to: 'companies#trunc_reset'

end
