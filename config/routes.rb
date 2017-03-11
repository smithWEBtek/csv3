Rails.application.routes.draw do

  resources :scrapers, :teachers, :companies
  get '/import_new_companies', to: 'tools#import_new_companies'
  get '/trunc_reset', to: 'tools#trunc_reset'
  get '/', to: 'tools#home'
  root to: '/'
end
