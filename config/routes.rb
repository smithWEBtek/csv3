Rails.application.routes.draw do
  root 'tools#home'
  resources :actions, :companies, :contacts, :jobs, :tools
  get '/import_new_companies', to: 'tools#import_new_companies'
  get '/trunc_reset', to: 'tools#trunc_reset'
end
