Rails.application.routes.draw do
  root 'tools#home'
  get '/test', to: 'tools#test'
  get '/add_pdfs', to: 'pdfs#add_pdfs'
  resources :actions, :companies, :contacts, :jobs, :tools, :pdfs
  get '/import_new_companies', to: 'tools#import_new_companies'
  get '/trunc_reset', to: 'tools#trunc_reset'
end
